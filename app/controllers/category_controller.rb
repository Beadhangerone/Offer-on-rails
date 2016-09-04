class CategoryController < ApplicationController
  def show
    $category = Category.where(url: "#{params[:id]}").take
    $ads = Ad.where(category: "#{$category.category}").order(created_at: :desc)
    @title = $category.category
  end
end
