require "test_helper"

class PhoneNumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get person's phone numbers" do
    get person_phone_numbers_path(Person.first), xhr: true

    assert_select "h1", "Phone Numbers"
    assert_response :success
  end

  test "should get new" do
    get new_person_phone_number_url(Person.first), xhr: true

    assert_equal "text/javascript", @response.media_type
  end

  test "should create phone number" do
    phone_number = {
      phone_number: "(555) 555-5555",
      comment: "comment",
    }

    assert_difference("PhoneNumber.count") do
      post person_phone_numbers_path(Person.first), params: {
        phone_number: phone_number
      }, xhr: true
    end

    assert_equal phone_number[:phone_number], PhoneNumber.last.phone_number
    assert_equal phone_number[:comment], PhoneNumber.last.comment

    assert_redirected_to person_path(Person.first)
  end

  test "should get edit" do
    person = Person.first
    phone_number = person.phone_numbers.first

    get edit_person_phone_number_path(person, phone_number), xhr: true

    assert_equal "text/javascript", @response.media_type
  end

  test "should update phone number" do
    person = Person.last
    phone_number = person.phone_numbers.first

    updated_phone_number = {
      phone_number: "(666) 666-6666",
      comment: "update comment",
    }

    patch person_phone_number_url(person, phone_number), params: {
      phone_number: updated_phone_number
    }, xhr: true

    phone_number.reload
    assert_equal updated_phone_number[:phone_number], phone_number.phone_number
    assert_equal updated_phone_number[:comment], phone_number.comment

    assert_redirected_to person_path(person)
  end

  test "should delete phone number" do
    person = Person.first
    phone_number = person.phone_numbers.first

    assert_difference("PhoneNumber.count", -1) do
      delete person_phone_number_path(person, phone_number), xhr: true
    end
    assert_redirected_to person_path(person)
  end
end
