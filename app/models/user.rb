# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password
  after_initialize :ensure_session_token

  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
  validates :user_name, presence: true, uniqueness: true

  validates :password, length: { minimum: 6, allow_nil: true }

  has_many(
    :cats,
    class_name: 'Cat',
    foreign_key: :owner_id
    )

  has_many :received_rental_requests, through: :cats, source: :rental_requests

  has_many(
    :placed_rental_requests,
    class_name: 'CatRentalRequest',
    foreign_key: :renter_id
  )

  def self.find_by_credentials(user_name, password)
    user = User.find_by_user_name(user_name)
    user if user && user.is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= reset_session_token!
  end

  def reset_session_token!
    token = SecureRandom.urlsafe_base64
    self.update(session_token: token)
    token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
