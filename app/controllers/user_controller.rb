class UserController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def show
    @title = "Пользователь"
    $user = User.where(username: "#{params[:id]}").take
  end

  def edit
    @username = params[:username]
    @old_pass = params[:old_pass]
    @new_pass = params[:new_pass]
    @new_pass_check = params[:new_pass_check]
    @phone = params[:phone]
    $error = validation_for("edit").join(" | ")
    if $error == ""      
      $client.username = @username if @username != ""      
      $client.pass = @new_pass if @old_pass != ""
      $client.phone = "#{$client.phone}, #{@phone}" if @phone != ""
      $client.save
      $success = "Изменения вступили в силу"
      redirect_to profile_path
    else
      redirect_to "/settings"
    end
  end

  def create
    $reg_username = params[:reg_username]
    @reg_pass = params[:reg_pass]
    @pass_check = params[:pass_check]
    $error = validation_for("registration").join(" | ")
    if $error == ""
      $client = User.new 
      $client.username = $reg_username
      $client.pass = @reg_pass
      $client.save
      $success = "Регистрация прошла успешно"
      $reg_username = nil
      @reg_pass = nil
      redirect_to profile_path
    else
      redirect_to "/"
    end
  end

  def login
    $username = params[:username]
    @pass = params[:pass]
    $error = validation_for("login").join(" | ")
    if $error == ""
      $success = "Вход прошел успешно"
      $username = nil
      @pass = nil
      redirect_to profile_path
    else
      redirect_to "/"
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

      if User.where(username: "#{$reg_username}").take != nil
        errors << "Логин занят"
      elsif $reg_username.length == 0
        errors << "Введите логин"
      elsif $reg_username.length < 3 && $reg_username.length > 0
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
      
      if $username.length == 0
        errors << "Введите логин"
      end

      if @pass.length == 0
        errors << "Введите пароль"
      end

      if $username != "" && @pass != ""
        $client = User.where(username: "#{$username}").take
        if $client == nil or $client.pass != @pass
          $client = nil
          errors << "Неверный логин или пароль"
        end
      end
      return errors

    elsif type == "edit"
      if @username != $client.username        
        if User.where(username: "#{@username}").take != nil
          errors << "Логин занят"
        elsif @username.length < 3 && @username.length > 0
          errors << "Логин слишком короткий(минимум 3 символа)"
        end       
      end  

      if @old_pass == $client.pass
        if @new_pass.length < 5 && @new_pass.length > 0
          errors << "Новый пароль слишком короткий(минимум 5 символов)"
        end
        errors << "Пароли не совпадают" if @new_pass.to_s != @new_pass_check.to_s
      elsif @old_pass.length != 0 && @old_pass != $client.pass
        errors << "Неверный прежний пароль"
      end
      return errors
    end         
  end
end
