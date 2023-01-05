class Address < ApplicationRecord
  belongs_to :person

  validates :street, presence: true
  validates :street, length: { maximum: 30 }

  validates :city, presence: true
  validates :city, length: { maximum: 15 }

  validates :state, presence: true
end