class BlogsController < InheritedResources::Base
  before_filter :require_login, except: [:index, :show]

  def index
    @blogs = Blog.order('created_at desc').page(params[:page]).per_page(10)
  end

  def show
    @blog = Blog.find_by_slug(params[:id])
    @comments = Comment.only_parent_comments(@blog)
  end

  def follow_blog
    if params[:id].present?
      render json: current_user.follow_blog(params[:id])
    else
      render json: 'Error! Blog not found...'
    end
  end

  def unfollow_blog
    if params[:id].present?
      render json: current_user.unfollow_blog(params[:id])
    else
      render json: 'Error! Blog not found...'
    end
  end

  def post_comment
    if params[:id].present?
      parent_comment_id = params[:parent_comment_id].present? ? params[:parent_comment_id] : 0
      render json: current_user.post_comment(params[:id], params[:message], parent_comment_id)
    else
      render json: 'Error! Blog not found...'
    end
  end

  def delete_comment
    if params[:id].present?
      render json: current_user.delete_comment(params[:id], params[:comment_id])
    else
      render json: 'Error! Blog not found...'
    end
  end
end