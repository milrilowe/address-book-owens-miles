json.address do
  json.id @address.id
  json.street @address.street
  json.town @address.town
  json.zip_code @address.zip_code
  json.state @address.state
  json.country @address.country
  json.person_id @address.person_id
  json.created_at @address.created_at
  json.updated_at @address.updated_at
end