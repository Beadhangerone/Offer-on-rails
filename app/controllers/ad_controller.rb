class AdController < ApplicationController

  skip_before_filter :verify_authenticity_token


  def new
    @title = "Написать объявление"
    unless $client
      $error = "Сначала войдите"
      redirect_to "/"
    end
  end

  def create
    @category = params[:category]
    @bill_type = params[:sell_buy]
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
    @title = "Объявление"
    $ad = Ad.where(id: "#{params[:id]}").take
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
