class Comment < ActiveRecord::Base
  attr_accessible :message, :user_id, :blog_id, :parent_comment_id

  acts_as_likeable

  belongs_to :user
  belongs_to :blog
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_comment_id'
  belongs_to :parent_comment, class_name: 'Comment'

  validates :message, :user_id, :blog_id, presence: true

  scope :only_parent_comments, -> { where(parent_comment_id: 0) }
end