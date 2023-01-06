class AddressSerializer < ActiveModel::Serializer
  attributes :id, :email_address, :comment, :person_id
end