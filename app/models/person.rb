class Person < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :emails, dependent: :destroy
  has_many :phone_numbers, dependent: :destroy

  validates :salutation, presence: true, inclusion: {
    in: %w(Mr. Mrs. Ms.),
    message: "%{value} is not a valid salutation"
  }

  validates :first_name, presence: true

  validates :last_name, presence: true

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
end