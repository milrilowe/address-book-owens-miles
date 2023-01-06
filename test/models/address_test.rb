require "test_helper"

class AddressTest < ActiveSupport::TestCase
  test "should save address with all fields" do
    address = Address.new(street: "street", town: "town", zip_code: "zip", state: "state", country: "country", person: Person.first)
    assert address.save, "Did not save the address with all fields"
  end

  test "should save address with only required fields" do
    address = Address.new(street: "street", town: "town", zip_code: "zip", person: Person.first)
    assert address.save, "Did not save the address with only required fields"
  end

  test "should not save address without street" do
    address = Address.new(town: "town", zip_code: "zip", state: "state", country: "country", person: Person.first)
    assert_not address.save, "Saved the address without a street"
  end

  test "should not save address without town" do
    address = Address.new(street: "street", zip_code: "zip", state: "state", country: "country", person: Person.first)
    assert_not address.save, "Saved the address without a town"
  end

  test "should not save address without zip" do
    address = Address.new(street: "street", town: "town", state: "state", country: "country", person: Person.first)
    assert_not address.save, "Saved the address without a zip"
  end

  test "should not save address without person" do
    address = Address.new(street: "street", town: "town", zip_code: "zip", state: "state", country: "country")
    assert_not address.save, "Saved the address without a person"
  end
end
