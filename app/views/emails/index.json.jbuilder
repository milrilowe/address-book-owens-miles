json.array! @emails do |email|
  json.id email.id
  json.email_address email.email_address
  json.comment email.comment
  json.person_id email.person_id
  json.created_at email.created_at
  json.updated_at email.updated_at
end