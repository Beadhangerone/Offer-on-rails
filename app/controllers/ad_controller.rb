class AdController < ApplicationController
  def new
    @title = "Написать объявление"
    unless $client
      $error = "Сначала войдите"
    end
  end

  def create
  end

  def latest
    @title = "Последние объявления"
    @ads = Ad.last(5)
    @ads.reverse!
  end


end
