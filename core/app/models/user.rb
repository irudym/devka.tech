class User < ApplicationRecord
  # has_one :admin
  has_many :questions
  # has_many :comments
  has_secure_password

  validates_presence_of :nickname, :email, :password_digest

  def is_admin?
    # admin != nil
    false
  end

end
