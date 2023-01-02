require "test_helper"

class PersonTest < ActiveSupport::TestCase
  name_char_limit = 15

  test "valid if has first and last" do
    person = Person.new(first_name: "John", last_name: "Doe")
    assert person.valid?
  end

  test "invalid if missing first or last" do
    person = Person.new(last_name: "Doe")
    assert_not person.valid?

    person = Person.new(first_name: "John")
    assert_not person.valid?
  end

  # test "invalid if first or last does not start with a letter"

  # end

  test "invalid if first or last is too long" do
    person = Person.new(first_name: "A" * (name_char_limit + 1), last_name: "Doe")
    assert_not person.valid?

    person = Person.new(first_name: "John", last_name: "A" * (name_char_limit + 1))
    assert_not person.valid?

    person = Person.new(first_name: "A" * (name_char_limit), last_name: "A" * (name_char_limit))
    assert person.valid?
  end

  test "valid ssn format" do
    person = Person.new(first_name: "John", last_name: "Doe", ssn: "123-45-6789")
    assert person.valid?
  end

  test "invalid if ssn is not 9 digits" do
    person = Person.new(first_name: "John", last_name: "Doe", ssn: "123-456-789")
    assert_not person.valid?

    person = Person.new(first_name: "John", last_name: "Doe", ssn: "123-456-7890")
    assert_not person.valid?
  end

  test "invalid if ssn is not in XXX-XX-XXXX format" do
    person = Person.new(first_name: "John", last_name: "Doe", ssn: "123456789")
    assert_not person.valid?

    person = Person.new(first_name: "John", last_name: "Doe", ssn: "123-456789")
    assert_not person.valid?

    person = Person.new(first_name: "John", last_name: "Doe", ssn: "123-456-789")
    assert_not person.valid?
  end

  test "invalid if ssn is not a valid SSN" do
    person = Person.new(first_name: "John", last_name: "Doe", ssn: "000-00-0000")
    assert_not person.valid?
  end
end
