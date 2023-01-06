require "test_helper"

class EmailsControllerTest < ActionDispatch::IntegrationTest
  def setup
    user = User.first

    post sign_in_url, params: {
      email: user.email,
      password: "password"
    }

    follow_redirect!
    assert_response :success
  end

  def teardown
    delete logout_url

    follow_redirect!
    assert_response :success
  end

  test "should get new" do
    user = User.first

    post sign_in_url, params: {
      email: user.email,
      password: "password"
    }

    follow_redirect!
    assert_response :success

    get new_person_email_url(Person.first), xhr: true

    assert_equal "text/javascript", @response.media_type
  end

  test "should create email" do
    user = User.first

    post sign_in_url, params: {
      email: user.email,
      password: "password"
    }

    follow_redirect!
    assert_response :success

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

    assert_equal "text/javascript", @response.media_type
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

    assert_equal "text/javascript", @response.media_type
  end

  test "should delete email" do
    person = Person.first
    email = person.emails.first

    assert_difference("Email.count", -1) do
      delete person_email_path(person, email), xhr: true
    end
    assert_equal "text/javascript", @response.media_type
  end
end
