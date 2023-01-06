class Address < ApplicationRecord
  belongs_to :person

  validates :street, presence: true
  validates :street, length: { maximum: 30 }

  validates :town, presence: true
  validates :town, length: { maximum: 15 }

  validates :zip_code, presence: true
end