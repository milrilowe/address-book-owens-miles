require "application_system_test_case"
require "test_helper"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:full_person)
  end

  test "create an address" do
    visit person_url(@person)

    click_on "Add Address"
    fill_in "Street", with: "456 Not Real Ave."
    fill_in "Town", with: "Springfield"
    fill_in "Zip code", with: "12345"
    fill_in "State", with: "IL"
    within "select[id^='address_country']" do
      select "Afghanistan"
    end
    click_on "Create Address"

    assert_text "Address was successfully created"
    assert_text(:all, "Street: 456 Not Real Ave.")
    assert_text(:all, "Town: Springfield")
    assert_text(:all, "Zip Code: 12345")
    assert_text(:all, "State: IL")
    assert_text(:all, "Country: Afghanistan")

  end

  test "update an address" do
    visit person_url(@person)
    within ".edit-address" do
      click_on "Edit"
    end
    fill_in "Street", with: "456 Not Real Ave."
    fill_in "Town", with: "Springfield"
    fill_in "Zip code", with: "12345"
    fill_in "State", with: "IL"
    within "select[id^='address_country']" do
      select "Afghanistan"
    end
    click_on "Update Address"
    assert_text "Address was successfully updated"
    assert_text(:all, "Street: 456 Not Real Ave.")
    assert_text(:all, "Town: Springfield")
    assert_text(:all, "Zip Code: 12345")
    assert_text(:all, "State: IL")
    assert_text(:all, "Country: Afghanistan")

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
    assert_selector "h1", text: "Mr. First Middle Last"
  end
end