json.person do
  json.id @person.id
  json.salutation @person.salutation
  json.first_name @person.first_name
  json.middle_name @person.middle_name
  json.last_name @person.last_name
  json.ssn @person.ssn
  json.birth_date @person.birth_date
  json.comment @person.comment
  json.address @person.addresses, :street, :town, :zip_code, :state, :country, :person_id, :created_at
  json.email @person.emails, :email_address, :person_id, :created_at
  json.phone_number @person.phone_numbers, :phone_number, :person_id, :created_at
  json.created_at @person.created_at
  json.updated_at @person.updated_at
end