class User < ApplicationRecord
  has_many :people

  has_secure_password

  validates :email, presence: true, format: { with: /\A(^[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+$)\z/, message: "must be a valid email address" }
end
