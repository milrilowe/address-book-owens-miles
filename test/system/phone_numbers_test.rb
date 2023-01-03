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
    fill_in "Phone number", with: "(444) 444-4444"
    fill_in "Comment", with: "This is a comment."
    click_on "Create Phone number"
    assert_text "Phone Number was successfully created"
    assert_text(:all, "(444) 444-4444")
    assert_text(:all, "Comment: This is a comment.")
  end

  test "update a phone number" do
    visit person_url(@person)
    within ".edit-phone-number" do
      click_on "Edit"
    end
    fill_in "Phone number", with: "(333) 333-3333"
    fill_in "Comment", with: "This is an updated comment."
    click_on "Update Phone number"
    assert_text "Phone Number was successfully updated"
    assert_text(:all, "(333) 333-3333")
    assert_text(:all, "Comment: This is an updated comment.")

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
    assert_selector "h1", text: "Mr. First Middle Last"
  end
end