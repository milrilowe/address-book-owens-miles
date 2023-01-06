require "test_helper"

class PhoneNumberTest < ActiveSupport::TestCase
  test "should save phone number with all fields" do
    phone_number = PhoneNumber.new(phone_number: "1234567890", comment: "comment", person: Person.first)
    assert phone_number.save, "Did not save the phone number with all fields"
  end

  test "should save phone number with only required fields" do
    phone_number = PhoneNumber.new(phone_number: "1234567890", person: Person.first)
    assert phone_number.save, "Did not save the phone number with only required fields"
  end

  test "should not save phone number without number" do
    phone_number = PhoneNumber.new(comment: "comment", person: Person.first)
    assert_not phone_number.save, "Saved the phone number without a number"
  end

  test "should not save phone number with invalid number (too few)" do
    phone_number = PhoneNumber.new(phone_number: "123", person: Person.first)
    assert_not phone_number.save, "Saved the phone number with an invalid number"
  end

  test "should not save phone number with invalid number (too many)" do
    phone_number = PhoneNumber.new(phone_number: "12345678901", person: Person.first)
    assert_not phone_number.save, "Saved the phone number with an invalid number"
  end

  test "should not save phone number with invalid number (non-number)" do
    phone_number = PhoneNumber.new(phone_number: "123456789a", person: Person.first)
    assert_not phone_number.save, "Saved the phone number with an invalid number"
  end

  test "should save phone number with valid number" do
    phone_number = PhoneNumber.new(phone_number: "+90 (123) 456-7890", person: Person.first)
    assert phone_number.save, "Did not save the phone number with a valid number"
  end


  test "should not save phone number without person" do
    phone_number = PhoneNumber.new(phone_number: "1234567890")
    assert_not phone_number.save, "Saved the phone number without a person"
  end
end
