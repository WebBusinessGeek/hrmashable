class Blog < ActiveRecord::Base
  attr_accessible :description, :slug, :title, :author_id, :category_id, :main_pic, :tag_ids, :temp_category
  
  attr_accessor :temp_category
  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :main_pic, MainBlogPicUploader

  belongs_to :author
  belongs_to :category
  
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tags
  has_many :comments

  validates :title, :author_id, :category_id, :main_pic, presence: true

  scope :sort_by_comments, -> { joins('LEFT OUTER JOIN comments ON comments.blog_id = blogs.id').group('blogs.id').order('count(comments.id) DESC') }

  def self.text_search(query)
    if query.present?
      where("title @@ :q or description @@ :q", q: sanitize(query))
    else
      scoped
    end
  end
end
