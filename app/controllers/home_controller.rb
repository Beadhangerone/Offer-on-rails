class HomeController < ApplicationController
  def index
    @title = "Offer.md"
    $ads = Ad.last(20)
    $ads.reverse!
  end

  def registration
    @title = "Регистрация"
  end

  def profile
    @title = "Ваш профиль"
    unless $client
      $error = "Сначала войдите или зарегистрируйтесь"
      redirect_to "/"
    end
  end

  def logout
    $client = nil
    redirect_to "/"
  end

  def settings
    @title = "Настройки"
  end

 
end
