require "test_helper"

class EmailTest < ActiveSupport::TestCase
  test "should save email with all fields" do
    email = Email.new(email_address: "address@email.com", comment: "comment", person: Person.first)
    assert email.save, "Did not save the email with all fields"
  end

  test "should save email with only required fields" do
    email = Email.new(email_address: "address@email.com", person: Person.first)
    assert email.save, "Did not save the email with only required fields"
  end

  test "should not save email without email_address" do
    email = Email.new(comment: "comment", person: Person.first)
    assert_not email.save, "Saved the email without an address"
  end

  test "should not save email with invalid email_address" do
    email = Email.new(email_address: "address", person: Person.first)
    assert_not email.save, "Saved the email with an invalid address"
  end

  test "should not save email without person" do
    email = Email.new(email_address: "address@email.com")
    assert_not email.save, "Saved the email without a person"
  end
end
