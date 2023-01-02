require "application_system_test_case"
require "test_helper"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:full_person)
    @phone_number = phone_numbers(:one)
  end

  test "create a phone number" do
    visit person_url(@person)

    click_on "Add Phone Number"
    click_on "Create Phone number"
    assert_text "Phone Number was successfully created"
  end

  test "update a phone number" do
    visit person_url(@person)
    within ".edit-phone-number" do
      click_on "Edit"
    end
    fill_in "Phone number", with: "(555) 555-5555"
    click_on "Update Phone number"
    assert_text "Phone Number was successfully updated"
  end

  test "destroy a phone number" do
    visit person_url(@person)
    within ".edit-phone-number" do
      click_on "Edit"
    end
    page.accept_confirm do
      click_on "Delete"
    end
    assert_text "Phone Number was successfully destroyed"
  end
end