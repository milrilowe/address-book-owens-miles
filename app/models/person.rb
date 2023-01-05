class Person < ApplicationRecord
  belongs_to :user

  has_many :addresses, dependent: :destroy
  has_many :emails, dependent: :destroy
  has_many :phone_numbers, dependent: :destroy

  before_save :set_default_fields

  validates :salutation, inclusion: {
    in: [nil, '', 'Mr.', 'Mrs.', 'Ms.'], # I'd prefer to not have nil included
    message: "%{value} is not a valid salutation"
  }

  validates :first_name, presence: true

  validates :first_name, format: { with: /\A^[a-zA-Z].*\z/, message: "must begin with a letter" }

  validates :first_name, format: { with: /\A([a-zA-Z\-.]+)\z/, message: "can only contain letters, periods, and hyphens" }

  validates :first_name , length: { maximum: 15 }

  validates :last_name, presence: true

  validates :last_name, format: { with: /\A^[a-zA-Z].*\z/, message: "must begin with a letter" }

  validates :last_name, format: { with: /\A([a-zA-Z\-.]+)\z/, message: "can only contain letters, periods, and hyphens" }

  validates :last_name , length: { maximum: 15 }

  # https://www.oreilly.com/library/view/regular-expressions-cookbook/9781449327453/ch04s12.html
  # ^$ matches an empty string, ^(?!... matches an SSN.  There is a | between the two expressions because SSN is optional
  validates :ssn, format: {
    with: /\A^$|^(?!000|666)[0-8][0-9]{2}-(?!00)[0-9]{2}-(?!000)[0-9]{4}$\z/,
    message: "must follow XXX-XX-XXXX format and be a valid SSN"
  }

  def full_name
    "#{salutation} #{first_name} #{middle_name} #{last_name}"
  end

  def informal_name
    "#{first_name} #{last_name}"
  end

  def set_default_fields
    self.salutation = "" if self.salutation.nil?
    self.middle_name = "" if self.middle_name.nil?
    self.ssn = "" if self.ssn.nil?
    self.comment = "" if self.comment.nil?
  end
end