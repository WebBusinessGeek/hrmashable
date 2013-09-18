class Author < ActiveRecord::Base
  attr_accessible :name, :profile_pic

  mount_uploader :profile_pic, AuthorProfilePicUploader
  
  validates :name, :profile_pic, presence: true
end
