class Person < ApplicationRecord

  validates :salutation, presence: true, inclusion: {
    in: %w(Mr. Mrs. Ms.),
    message: "%{value} is not a valid salutation"
  }

  validates :first_name, presence: true

  validates :last_name, presence: true


  # https://www.oreilly.com/library/view/regular-expressions-cookbook/9781449327453/ch04s12.html
  validates :ssn, format: {
    with: /\A^(?!000|666)[0-8][0-9]{2}-(?!00)[0-9]{2}-(?!000)[0-9]{4}$\z/,
    message: "must follow XXX-XX-XXXX format"
  }
end
