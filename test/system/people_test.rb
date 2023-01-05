require "application_system_test_case"
require "test_helper"

class PeopleTest < ApplicationSystemTestCase

  setup do
    @person = people(:full_person)

    visit root_url
    if page.has_content?("Login")
      click_on "Login"
      find("#email").set("address@email.com")
      find("#password").set("password")
      find('#sign-in').click
    end
  end

  # Modal fade causes issues - this is a workaround
  def teardown
    find("#session-button")
    execute_script "$('#session-button').click()"
  end

  test "create a person" do
    find('#circle').click

    within "select[id^='person_salutation']" do
      select "Mr."
    end

    fill_in "First name", with: "John"
    fill_in "Middle name", with: "M."
    fill_in "Last name", with: "Doe"
    fill_in "Ssn", with: "123-45-6789"
    fill_in "Comment", with: "This is a comment."

    click_on "Create Person"

    assert_text "Person was successfully created"
    assert_text "Mr. John M. Doe"
    assert_text "Birthday: N/A"
    assert_text "SSN: 123-45-6789"
    assert_text "Comment: This is a comment."
  end

  # Modal fade causes issues - this is a workaround
  def teardown
    find("#session-button")
    execute_script "$('#session-button').click()"
  end


  test "update a person" do
    click_on "Last, First M."

    click_on "Edit Info"

    within "select[id^='person_salutation']" do
      select "Mrs."
    end

    fill_in "First name", with: ""
    fill_in "First name", with: "Jane"
    fill_in "Middle name", with: ""
    fill_in "Middle name", with: "N."
    fill_in "Last name", with: ""
    fill_in "Last name", with: "Deer"
    fill_in "Ssn", with: ""
    fill_in "Ssn", with: "897-65-4321"
    fill_in "Birth date", with: ""
    fill_in "Comment", with: ""
    fill_in "Comment", with: "This is an updated comment."

    click_on "Update Person"

    assert_text "Mrs. Jane N. Deer"
    assert_text "Birthday: N/A"
    assert_text "SSN: 897-65-4321"
    assert_text "Comment: This is an updated comment."
  end

  test "destroy a person" do
    click_on "Last, First M."

    click_on "Edit Info"

    page.accept_confirm do
      click_on "Delete"
    end

    assert_text "Person was successfully destroyed"
  end

end