class CategoriesController < ApplicationController
  def show
    @category = Category.find_by_slug(params[:id])
    @blogs = @category.blogs if @category.present?
  end
end