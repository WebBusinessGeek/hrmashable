class CategoriesController < ApplicationController
  def show
    @category ||= Category.find_by_slug(params[:id])
    @left_blogs ||= @category.blogs.text_search(params[:query]).order('visitors_count desc').page(params[:page]).per_page(5) if @category.present?
    @center_blogs ||= @category.blogs.text_search(params[:query]).order('created_at desc').page(params[:page]).per_page(5) if @category.present?
    @right_blogs ||= @category.blogs.text_search(params[:query]).sort_by_comments.page(params[:page]).per_page(5) if @category.present?
  end
end