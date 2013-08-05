class Comment < ActiveRecord::Base
  attr_accessible :message, :user_id, :blog_id, :parent_comment_id

  belongs_to :user
  belongs_to :blog
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_comment_id'
  belongs_to :parent_comment, class_name: 'Comment'

  validates :message, :user_id, :blog_id, presence: true
end