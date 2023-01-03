require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase

  setup do
    @person = people(:full_person)
    @email = emails(:one)
  end

  test "create an email" do
    visit person_url(@person)

    click_on "Emails"
    click_on "Add Email"

    fill_in "Email address", with: "gma@il.com"
    fill_in "Comment", with: "This is a comment."

    click_on "Create Email"

    assert_text "Email was successfully created"
    assert_text(:all, "gma@il.com")
    assert_text(:all, "Comment: This is a comment.")
  end

  test "update an email" do
    visit person_url(@person)

    click_on "Emails"
    within ".edit-email" do
      click_on "Edit"
    end

    fill_in "Email address", with: "ema@il.com"
    fill_in "Comment", with: "This is an updated comment."

    click_on "Update Email"

    assert_text "Email was successfully updated"
    assert_text(:all, "ema@il.com")
    assert_text(:all, "Comment: This is an updated comment.")
  end

  test "destroy an email" do
    visit person_url(@person)

    click_on "Emails"
    within ".edit-email" do
      click_on "Edit"
    end

    page.accept_confirm do
      click_on "Delete"
    end

    assert_text "Email was successfully destroyed"
    assert_selector "h1", text: "Mr. First Middle Last"
  end
end