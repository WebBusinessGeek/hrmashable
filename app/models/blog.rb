class Blog < ActiveRecord::Base
  attr_accessible :description, :slug, :title, :author_id, :category_id, :main_pic

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :main_pic, MainBlogPicUploader

  belongs_to :author
  belongs_to :category
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tags
  has_many :comments

  validates :title, :author_id, :category_id, presence: true
end