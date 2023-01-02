class Email < ApplicationRecord
  belongs_to :person

  validates :email_address, presence: true
  validates :email_address, format: { with: /\A(^[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+$)\z/, message: "must be a valid email address" }
end
