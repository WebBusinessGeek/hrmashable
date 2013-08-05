class Tag < ActiveRecord::Base
  attr_accessible :slug, :title

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_and_belongs_to_many :blogs

  validates :title, presence: true
end