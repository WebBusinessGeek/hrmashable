class BlogsController < InheritedResources::Base
  before_filter :require_login, except: [:index, :show]

  def index
    @blogs ||= Blog.text_search(params[:query]).order('created_at desc').page(params[:page]).per_page(10)
  end

  def show
    @blog ||= Blog.find_by_slug(params[:id])

    if params[:direction].present?
      @comments ||= @blog.comments.order("updated_at #{params[:direction].downcase}").only_parent_comments
    # elsif params[:basis].present?
    #   @comments ||= @blog.comments.order("updated_at desc").only_parent_comments
    else
      @comments ||= @blog.comments.order('updated_at desc').only_parent_comments
    end
  end

  def follow_blog
    if params[:id].present?
      blog ||= Blog.find_by_id(params[:id])
      current_user.follow_blog(params[:id])
      redirect_to blog_path(blog.created_at.strftime('%Y'), blog.created_at.strftime('%m'), blog.created_at.strftime('%d'), blog.slug), notice: 'Now following this blog...'
    else
      redirect_to blog_path(blog.created_at.strftime('%Y'), blog.created_at.strftime('%m'), blog.created_at.strftime('%d'), blog.slug), notice: 'Error! Please try again later...'
    end
  end

  def unfollow_blog
    if params[:id].present?
      blog ||= Blog.find_by_id(params[:id])
      current_user.unfollow_blog(params[:id])
      redirect_to blog_path(blog.created_at.strftime('%Y'), blog.created_at.strftime('%m'), blog.created_at.strftime('%d'), blog.slug), notice: 'No longer following this blog...'
    else
      redirect_to blog_path(blog.created_at.strftime('%Y'), blog.created_at.strftime('%m'), blog.created_at.strftime('%d'), blog.slug), notice: 'Error! Please try again later...'
    end
  end

  def post_comment
    if params[:id].present?
      blog ||= Blog.find_by_id(params[:id])
      parent_comment_id ||= params[:parent_comment_id].present? ? params[:parent_comment_id] : 0
      current_user.post_comment(params[:id], params[:message], parent_comment_id)
      redirect_to blog_path(blog.created_at.strftime('%Y'), blog.created_at.strftime('%m'), blog.created_at.strftime('%d'), blog.slug), notice: 'Comment posted successfully...'
    else
      redirect_to blog_path(blog.created_at.strftime('%Y'), blog.created_at.strftime('%m'), blog.created_at.strftime('%d'), blog.slug), notice: 'Error! Please try again later...'
    end
  end

  def delete_comment
    if params[:id].present? && params[:comment_id]
      blog ||= Blog.find_by_id(params[:id])
      current_user.delete_comment(params[:id], params[:comment_id])
      redirect_to blog_path(blog.created_at.strftime('%Y'), blog.created_at.strftime('%m'), blog.created_at.strftime('%d'), blog.slug), notice: 'Comment deleted successfully...'
    else
      redirect_to blog_path(blog.created_at.strftime('%Y'), blog.created_at.strftime('%m'), blog.created_at.strftime('%d'), blog.slug), notice: 'Error! Please try again later...'
    end
  end

  def like_comment
    if params[:id].present? && params[:comment_id]
      blog ||= Blog.find_by_id(params[:id])
      comment ||= Comment.find_by_id(params[:comment_id])
      current_user.like(comment)
      redirect_to blog_path(blog.created_at.strftime('%Y'), blog.created_at.strftime('%m'), blog.created_at.strftime('%d'), blog.slug), notice: 'Like the specified comment...'
    else
      redirect_to blog_path(blog.created_at.strftime('%Y'), blog.created_at.strftime('%m'), blog.created_at.strftime('%d'), blog.slug), notice: 'Error! Please try again later...'
    end
  end

  def unlike_comment
    if params[:id].present? && params[:comment_id]
      blog ||= Blog.find_by_id(params[:id])
      comment ||= Comment.find_by_id(params[:comment_id])
      current_user.dislike(comment)
      redirect_to blog_path(blog.created_at.strftime('%Y'), blog.created_at.strftime('%m'), blog.created_at.strftime('%d'), blog.slug), notice: 'Unliked the specified comment...'
    else
      redirect_to blog_path(blog.created_at.strftime('%Y'), blog.created_at.strftime('%m'), blog.created_at.strftime('%d'), blog.slug), notice: 'Error! Please try again later...'
    end
  end
end