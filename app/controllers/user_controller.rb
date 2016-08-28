class UserController < ApplicationController
  skip_before_filter :verify_authenticity_token


  def create
    @reg_username = params[:reg_username]
    @reg_pass = params[:reg_pass]
    @pass_check = params[:pass_check]
    $error = validation_for("registration").join(" | ")
    if $error == ""
      $client = User.new 
      $client.username = @reg_username
      $client.pass = @reg_pass
      $client.save
      $success = "Регистрация прошла успешно"
      redirect_to profile_path
    else
      redirect_to "/registration"
    end
  end

  def login
    @username = params[:username]
    @pass = params[:pass]
    $error = validation_for("login").join(" | ")
    if $error != ""
      redirect_to "/"
    else
      $success = "Вход прошел успешно"
      redirect_to profile_path  
    end
  end

  def ads
    @title = "Ваши объявления"
    $ads = Ad.order('id DESC').where(author: "#{$client.username}")
  end






  private

  def validation_for(type)
    errors=[]
    if type == "registration"
      if User.where(username: "#{@reg_username}").take != nil
        errors << "Логин занят"
      elsif @reg_username.length == 0
        errors << "Введите логин"
      elsif @reg_username.length < 3 && @reg_username.length > 0
        errors << "Логин слишком короткий(минимум 3 символа)"
      end

      if @reg_pass.length == 0
        errors << "Введите пароль"
      elsif @reg_pass.length < 5 && @reg_pass.length > 0
        errors << "Пароль слишком короткий(минимум 5 символов)"
      end

      errors << "Пароли не совпадают" if @reg_pass.to_s != @pass_check.to_s
      return errors          
    elsif type == "login"
      if @username.length == 0
        errors << "Введите логин"
      end

      if @pass.length == 0
        errors << "Введите пароль"
      end

      if @username != "" && @pass != ""
        $client = User.where(username: "#{@username}").take
        if $client == nil or $client.pass != @pass
          $client = nil
          errors << "Неверный логин или пароль"
        end
      end
      return errors
    end
  end

end
