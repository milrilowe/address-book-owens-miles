require "test_helper"

class EmailsControllerTest < ActionDispatch::IntegrationTest
  test "should get person's emails" do
    get person_emails_path(Person.first), xhr: true

    assert_select "h1", "Emails"
    assert_response :success
  end

  test "should get new" do
    get new_person_email_url(Person.first), xhr: true

    assert_equal "text/javascript", @response.media_type
  end

  test "should create email" do
    email = {
      email_address: "gm@il.com",
      comment: "comment",
    }

    assert_difference("Email.count") do
      post person_emails_path(Person.first), params: {
        email: email
      }, xhr: true
    end

    assert_equal email[:email_address], Email.last.email_address
    assert_equal email[:comment], Email.last.comment

    assert_redirected_to person_path(Person.first)
  end

  test "should get edit" do
    person = Person.first
    email = person.emails.first

    get edit_person_email_path(person, email), xhr: true

    assert_equal "text/javascript", @response.media_type
  end

  test "should update email" do
    person = Person.last
    email = person.emails.first

    updated_email ={
      email_address: "update@email.com",
      comment: "update comment",
    }

    patch person_email_url(person, email), params: {
      email: updated_email
    }, xhr: true

    email.reload

    assert_equal updated_email[:email_address], email.email_address
    assert_equal updated_email[:comment], email.comment

    assert_redirected_to person_path(person)
  end

  test "should delete email" do
    person = Person.first
    email = person.emails.first

    assert_difference("Email.count", -1) do
      delete person_email_path(person, email), xhr: true
    end
    assert_redirected_to person_path(person)
  end
end
