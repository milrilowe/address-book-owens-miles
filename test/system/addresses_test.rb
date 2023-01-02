require "application_system_test_case"
require "test_helper"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:full_person)
    @address = addresses(:one)
  end

  test "create an address" do
    visit person_url(@person)

    click_on "Add Address"
    click_on "Create Address"
    assert_text "Address was successfully created"
  end

  test "update an address" do
    visit person_url(@person)
    within ".edit-address" do
      click_on "Edit"
    end
    fill_in "Street", with: "123 Fake St."
    click_on "Update Address"
    assert_text "Address was successfully updated"
  end

  test "destroy an address" do
    visit person_url(@person)
    within ".edit-address" do
      click_on "Edit"
    end
    page.accept_confirm do
      click_on "Delete"
    end
    assert_text "Address was successfully destroyed"
  end
end