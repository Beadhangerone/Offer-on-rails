class UserController < ApplicationController

  skip_before_filter :verify_authenticity_token
  def create
    pars={}
    reg_username=params[:reg_username]
    reg_pass=params[:reg_pass]
    pass_check=params[:pass_check]
    $client=User.new 
    $client.username = reg_username
    $client.pass = reg_pass
    $client.save
    redirect_to profile_path
    @success = "Регистрация прошла успешно"
  end
end
