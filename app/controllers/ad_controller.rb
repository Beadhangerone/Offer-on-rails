class AdController < ApplicationController

  skip_before_filter :verify_authenticity_token


  def new
    @title = "Написать объявление"
    unless $client
      $error = "Сначала войдите или зарегистрируйтесь"
      redirect_to "/"
    end
  end

  def create
    @category = params[:category]
    @bill_type = params[:bill_type]
    @ad_header = params[:ad_header]
    @ad_text = params[:ad_text]

    
    $error = validation_for("ad/new").join " | "

    if $error != ""
      redirect_to "/ad"
    else
      @ad=Ad.new 
        @ad.author = $client.username
        @ad.category = @category
        @ad.bill_type = @bill_type
        @ad.ad_header = @ad_header
        @ad.ad_text = @ad_text
      @ad.save

      $client.total_ads +=1
      $client.save
      $success="Объявление подано!"
      redirect_to @ad
    end   
  end

  def show
    $ad = Ad.where(id: "#{params[:id]}").take
    @title = $ad.ad_header
  end

  def edit
    @title = "Редактирование объявления" 
  end

  def update
    @category = $ad.category
    @bill_type = params[:bill_type]
    @ad_header = params[:ad_header]
    @ad_text = params[:ad_text]
    $error = validation_for("ad/new").join(" | ")
    if $error == ""
      $ad.bill_type = @bill_type
      $ad.ad_header = @ad_header
      $ad.ad_text = @ad_text
      $ad.save
      $success="Объявление отредактировано!"
      redirect_to $ad
    else 
      redirect_to edit_ad_path
    end 
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
  end

  def latest
    @title = "Последние объявления"
    $ads = Ad.last(5).take
    $ads.reverse!
  end


  private

  def validation_for(type)
    errors=[]
    if type == "ad/new"
      errors << 'Выберите категорию' if @category.to_s.length==0
      errors << 'Выберите тип предложения' if @bill_type.to_s.length==0
      errors << 'Введите заголовок объявления' if @ad_header.to_s.length==0
      errors << 'Введите текст объявления' if @ad_text.to_s.length==0
    end
    return errors
  end
end
