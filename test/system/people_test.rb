require "application_system_test_case"
require "test_helper"

class PeopleTest < ApplicationSystemTestCase

  setup do
    @person = people(:full_person)
  end

  test "visit index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "create a person" do
    visit people_url
    click_on "New Person"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    click_on "Create Person"
    assert_text "Person was successfully created"
  end

  test "update a person" do
    visit person_url(@person)
    click_on "Edit Info"
    fill_in "First name", with: "Jane"
    click_on "Update Person"
    assert_text "Person was successfully updated"
  end

  test "destroy a person" do
    visit person_url(@person)
    click_on "Edit Info"
    page.accept_confirm do
      click_on "Delete"
    end
    assert_text "Person was successfully destroyed"
  end

end