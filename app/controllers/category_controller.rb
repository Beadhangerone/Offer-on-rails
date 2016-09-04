class CategoryController < ApplicationController
  def show
    $category = Category.where(url: "#{params[:id]}").take
    @title = $category.category
  end
end
