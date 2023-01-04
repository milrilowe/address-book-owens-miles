require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get person's addresses" do
    get person_addresses_path(Person.first), xhr: true

    assert_select "h1", "Addresses"
    assert_response :success
  end

  test "should get new" do
    get new_person_address_url(Person.first), xhr: true

    assert_equal "text/javascript", @response.media_type
  end

  test "should create address" do
    address = {
      street: "street",
      town: "town",
      state: "state",
      zip_code: "12345",
      country: "country"
    }

    assert_difference("Address.count") do
      post person_addresses_path(Person.first), params: {
        address: address
      }, xhr: true
    end

    assert_equal address[:street], Address.last.street
    assert_equal address[:town], Address.last.town
    assert_equal address[:state], Address.last.state
    assert_equal address[:zip_code], Address.last.zip_code
    assert_equal address[:country], Address.last.country

    assert_redirected_to person_path(Person.first)
  end

  test "should get edit" do
    get edit_person_address_path(Person.first, Person.first.addresses.first), xhr: true

    assert_equal "text/javascript", @response.media_type
  end

  test "should update address" do
    person = Person.last
    address = person.addresses.first

    updated_address = {
      street: "update street",
      town: "update town",
      state: "update state",
      zip_code: "23456",
      country: "update country"
    }

    patch person_address_url(person, address), params: {
      address: updated_address
    }, xhr: true

    address.reload

    assert_equal updated_address[:street], address.street
    assert_equal updated_address[:town], address.town
    assert_equal updated_address[:state], address.state
    assert_equal updated_address[:zip_code], address.zip_code
    assert_equal updated_address[:country], address.country

    assert_redirected_to person_path(person)
  end

  test "should delete address" do
    person = Person.first
    address = person.addresses.first

    assert_difference("Address.count", -1) do
      delete person_address_path(person, address), xhr: true
    end

    assert_redirected_to person_path(person)
  end
end
