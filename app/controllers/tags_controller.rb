class TagsController < ApplicationController
  def show
    @tag ||= Tag.find_by_slug(params[:id])
    @left_blogs ||= @tag.blogs.text_search(params[:query]).order('visitors_count desc').page(params[:page]).per_page(5) if @tag.present?
    @center_blogs ||= @tag.blogs.text_search(params[:query]).order('created_at desc').page(params[:page]).per_page(5) if @tag.present?
    @right_blogs ||= @tag.blogs.text_search(params[:query]).sort_by_comments.page(params[:page]).per_page(5) if @tag.present?
  end
end