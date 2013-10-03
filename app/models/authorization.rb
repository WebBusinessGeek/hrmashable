class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id

  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      u = User.where(email: auth.info.email).first_or_initialize
      u.first_name = auth.info.first_name
      u.last_name = auth.info.last_name
      u.username = auth.info.nickname
      u.profile_pic = auth.info.image      
      u.password = Devise.friendly_token[0,20]
      u.save #!(validate: false)
      user.user_id = u.id
      user.provider = auth.provider
      user.uid = auth.uid
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires_at.present?
      user.save!
    end
  end
end
