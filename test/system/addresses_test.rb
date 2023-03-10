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


  test "create an address" do
    click_on "Last, First M."

    click_on "Addresses"
    click_on "Add Address"

    within "select[id^='address_country']" do
      select "Afghanistan"
    end
    fill_in "Street", with: "456 Not Real Ave."
    fill_in "Town", with: "Springfield"
    fill_in "Zip code", with: "12345"
    fill_in "State", with: "IL"

    click_on "Create Address"

    assert_text(:all, "Street: 456 Not Real Ave.")
    assert_text(:all, "Town: Springfield")
    assert_text(:all, "Zip Code: 12345")
    assert_text(:all, "State: IL")
    assert_text(:all, "Country: Afghanistan")

  end

  test "update an address" do
    click_on "Last, First M."

    click_on "Addresses"
    within ".edit-address" do
      click_on "Edit"
    end

    fill_in "Street", with: ""
    fill_in "Street", with: "456 Not Real Ave."
    fill_in "Town", with: ""
    fill_in "Town", with: "Springfield"
    fill_in "Zip code", with: ""
    fill_in "Zip code", with: "12345"
    fill_in "State", with: ""
    fill_in "State", with: "IL"
    within "select[id^='address_country']" do
      select "Afghanistan"
    end

    click_on "Update Address"

    assert_text(:all, "Street: 456 Not Real Ave.")
    assert_text(:all, "Town: Springfield")
    assert_text(:all, "Zip Code: 12345")
    assert_text(:all, "State: IL")
    assert_text(:all, "Country: Afghanistan")

  end

  test "destroy an address" do
    click_on "Last, First M."

    click_on "Addresses"
    within ".edit-address" do
      click_on "Edit"
    end

    page.accept_confirm do
      click_on "Delete"
    end

    assert_text "No addresses..."
    assert_selector "h1", text: "Mr. First Middle Last"
  end
end