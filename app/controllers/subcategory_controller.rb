class SubcategoryController < ApplicationController
  def show
    $category = Category.where(url: "#{params[:category_id]}").take
    $subcategory = Subcategory.where(url: "#{params[:id]}").all
    $ads = Ad.where(category: "#{$category.category}", subcategory:"#{$subcategory.subcategory}").order(created_at: :desc)
    @title = $category.category
  end
end
