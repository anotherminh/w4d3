class User < ActiveRecord::Base
  attr_reader :password
  after_initialize :ensure_session_token

  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
  validates :user_name, presence: true, uniqueness: true

  validates :password, length: { minimum: 6, allow_nil: true }

  def self.find_by_credentials(user_name, password)
    user = User.find_by_user_name(user_name)
    user if user && user.is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= reset_session_token!
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
