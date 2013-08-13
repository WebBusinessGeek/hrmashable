class CategoriesController < ApplicationController
  def show
    @category ||= Category.find_by_slug(params[:id])
    @blogs ||= @category.blogs.text_search(params[:query]).order('created_at desc').page(params[:page]).per_page(10) if @category.present?
  end
end