class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :about_me, :birthday, :email, :first_name, :gender, :last_name, :role, :username, :zipcode, :password, :password_confirmation,
   :remember_me, :slug, :profile_pic, :remote_profile_pic_url

  extend FriendlyId
  friendly_id :username, use: :slugged

  mount_uploader :profile_pic, UserProfilePicUploader

  validates :profile_pic, presence: true

  private
  def password_required?
    new_record? ? super : false
  end
end