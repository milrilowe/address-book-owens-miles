class PhoneNumber < ApplicationRecord
  belongs_to :person

  validates :phone_number, presence: true
  # https://stackoverflow.com/a/50122731
  validates :phone_number, format: { with: /\A(\+\d{1,3}\s?)?((\(\d{3}\)\s?)|(\d{3})(\s|-?))(\d{3}(\s|-?))(\d{4})(\s?(([E|e]xt[:|.|]?)|x|X)(\s?\d+))?\z/, message: "Must be in a valid format" }
end