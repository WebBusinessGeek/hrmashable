class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :about_me, :birthday, :email, :first_name, :gender, :last_name, :role, :username, :zipcode, :password, :password_confirmation, :remember_me

  extend FriendlyId
  friendly_id :username, use: :slugged
end