class BlogsController < InheritedResources::Base
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find_by_slug(params[:id])
    @comments = Comment.only_parent_comments(@blog)
  end

  def follow_blog
    if params[:id].present?
      render json: User.find_by_id(3).follow_blog(params[:id])
    else
      render json: 'Error! Blog not found...'
    end
  end

  def unfollow_blog
    if params[:id].present?
      render json: User.find_by_id(3).unfollow_blog(params[:id])
    else
      render json: 'Error! Blog not found...'
    end
  end

  def post_comment
    current_user = User.find_by_id(3)
    if params[:id].present?
      if current_user
        parent_comment_id = params[:parent_comment_id].present? ? params[:parent_comment_id] : 0
        render json: User.find_by_id(3).post_comment(params[:id], params[:message], parent_comment_id)
      else
        render json: 'Error! You must be signed in to post a comment...'
      end
    else
      render json: 'Error! Blog not found...'
    end
  end

  def delete_comment
    current_user = User.find_by_id(3)
    if params[:id].present?
      if current_user
        render json: User.find_by_id(3).delete_comment(params[:id], params[:comment_id])
      else
        render json: 'Error! You must be signed in to delete a comment...'
      end
    else
      render json: 'Error! Blog not found...'
    end
  end
end