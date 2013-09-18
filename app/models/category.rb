class Category < ActiveRecord::Base
  attr_accessible :slug, :title, :parent_category_id

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :blogs
  has_many :child_categories, class_name: 'Category', foreign_key: 'parent_category_id'
  belongs_to :parent_category, class_name: 'Category'

  validates :title, presence: true

  scope :only_parent_categories, -> { where(parent_category_id: [0, nil]) }
end