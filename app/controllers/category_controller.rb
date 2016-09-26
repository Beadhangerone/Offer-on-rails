class CategoryController < ApplicationController
  def show
    $category = Category.where(url: "#{params[:id]}").take
    $subcategories = Subcategory.where(category: "#{params[:id]}").all
    $ads = Ad.where(category: "#{$category.category}").order(created_at: :desc)
    @title = $category.category
  end
end
