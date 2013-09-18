class User < AdminUser
  acts_as_liker

  has_and_belongs_to_many :blogs
  has_many :comments
  has_many :authorizations

  default_scope { where(role: USER) }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def following_blog?(blog_id)
    blog ||= Blog.find_by_id(blog_id)

    if blog.present?
      blog_users ||= blog.users
      if blog_users.include?(self)
        return true
      else
        return false
      end
    else
      return 'Error! Blog not found...'
    end
  end

  def follow_blog(blog_id)
    blog ||= Blog.find_by_id(blog_id)

    if blog.present?
      if self.following_blog?(blog_id)
        return 'You are already following the specified blog...'
      else
        blog.users << self
        return 'You are now following the specified blog!'
      end
    else
      return 'Error! Blog not found...'
    end
  end

  def unfollow_blog(blog_id)
    blog ||= Blog.find_by_id(blog_id)

    if blog.present?
      if self.following_blog?(blog_id)
        blog.users.delete(self)
        return 'You are no longer following the specified blog!'
      else
        return 'Your are not following the specified blog...'
      end
    else
      return 'Error! Blog not found...'
    end
  end

  def post_comment(blog_id, msg, parent_comment_id = 0)
    blog ||= Blog.find_by_id(blog_id)

    if blog.present?
      comment = Comment.create(message: msg, user_id: self.id, blog_id: blog_id, parent_comment_id: parent_comment_id)
      blog.comments << comment
      return 'Your comment has been posted successfully...'
    else
      return 'Error! Blog not found...'
    end
  end

  def delete_comment(blog_id, comment_id)
    blog ||= Blog.find_by_id(blog_id)

    if blog.present?
      comment = blog.comments.find_by_id(comment_id)

      if comment.present?
        if comment.replies.size > 0
          comment.replies.each do |reply|
            delete_comment(blog_id, reply.id)
          end
          comment.destroy
        else
          comment.destroy
        end

        return 'Your comment has been deleted successfully...'
      else
        return 'Error! Comment not found...'
      end
    else
      return 'Error! Blog not found...'
    end
  end

  private

  def is_admin?
    false
  end
end