class Person < ApplicationRecord

  validates :salutation, presence: true, inclusion: {
    in: %w(Mr. Mrs. Ms.),
    message: "%{value} is not a valid salutation"
  }

  validates :first_name, presence: true

  validates :last_name, presence: true


  # www.geeksforgeeks.org/how-to-validate-ssn-social-security-number-using-regular-expression
  validates :ssn, format: {
    with: /\A(^(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$)\z/,
    message: "%{value}"
  }
end
