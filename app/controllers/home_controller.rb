class HomeController < ApplicationController
  def index
    @title = "Offer.md"
  end

  def registration
    @title = "Регистрация"
  end

  def profile
    @title = "Ваш профиль"
  end
end
