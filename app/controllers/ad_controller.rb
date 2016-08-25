class AdController < ApplicationController
  def new
    @title = "Написать объявление"
  end

  def crate
  end

  def latest
    @title = "Последние объявления"
  end
end
