require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase

  setup do
    @person = people(:full_person)
    @email = emails(:one)
  end

  test "create an email" do
    visit person_url(@person)
    click_on "Add Email"
    fill_in "Email address", with: "gma@il.com"
    click_on "Create Email"
    assert_text "Email was successfully created"
  end

  test "update an email" do
    visit person_url(@person)
    within ".edit-email" do
      click_on "Edit"
    end
    fill_in "Email address", with: "ema@il.com"
    click_on "Update Email"
    assert_text "Email was successfully updated"
  end

  test "destroy an email" do
    visit person_url(@person)
    within ".edit-email" do
      click_on "Edit"
    end
    page.accept_confirm do
      click_on "Delete"
    end
    assert_text "Email was successfully destroyed"
  end
end