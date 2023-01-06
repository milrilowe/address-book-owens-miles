class AddressSerializer < ActiveModel::Serializer
  attributes :id, :phone_number, :comment, :person_id
end