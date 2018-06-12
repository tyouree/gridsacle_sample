class User < ActiveRecord::Base

  # Validate User TABLE #
  validates :user_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user_email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },uniqueness: true

  before_save { self.user_email = user_email.downcase }

  has_secure_password excetp:[:controller => 'login_controller', :action => 'create']


end
