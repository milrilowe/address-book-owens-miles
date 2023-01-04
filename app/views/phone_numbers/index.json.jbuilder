json.array! @phone_numbers do |phone_number|
  json.id phone_number.id
  json.phone_number phone_number.phone_number
  json.comment phone_number.comment
  json.person_id phone_number.person_id
  json.created_at phone_number.created_at
  json.updated_at phone_number.updated_at
end