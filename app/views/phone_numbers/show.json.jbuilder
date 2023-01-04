json.phone_number do
  json.id @phone_number
  json.phone_number @phone_number.phone_number
  json.comment @phone_number.comment
  json.person_id @phone_number.person_id
  json.created_at @phone_number.created_at
  json.updated_at @phone_number.updated_at
end