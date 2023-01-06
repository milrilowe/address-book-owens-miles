class PersonSerializer < ActiveModel::Serializer
  attributes :id, :salutation, :first_name, :middle_name, :last_name, :ssn, :birth_date, :comment, :addresses, :emails, :phone_numbers
end