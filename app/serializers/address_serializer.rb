class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :town, :zip_code, :state, :country, :person_id
end