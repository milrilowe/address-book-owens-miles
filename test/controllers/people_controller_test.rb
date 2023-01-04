require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get people_url

    assert_select "h1", "People"
    assert_response :success
  end

  test "should get new" do
    get new_person_url, xhr: true

    assert_equal "text/javascript", @response.media_type
  end

  test "should create person" do
    person = {
      salutation: "Mr.",
      first_name: "first",
      middle_name: "middle",
      last_name: "last",
      ssn: "123-45-6789",
      comment: "comment"
    }

    assert_difference("Person.count") do
      post people_path, params: {
        person: person
      }, xhr: true
    end

    assert_equal person[:salutation], Person.last.salutation
    assert_equal person[:first_name], Person.last.first_name
    assert_equal person[:middle_name], Person.last.middle_name
    assert_equal person[:last_name], Person.last.last_name
    assert_equal person[:ssn], Person.last.ssn
    assert_equal person[:comment], Person.last.comment

    assert_redirected_to person_path(Person.last)
  end

  test "should get edit" do
    person = Person.first

    get edit_person_path(person), xhr: true

    assert_equal "text/javascript", @response.media_type
  end

  test "should update person" do
    person = Person.last

    updated_person = {
      salutation: "Ms.",
      first_name: "update-first",
      middle_name: "update-middle",
      last_name: "update-last",
      ssn: "234-56-7890",
      comment: "update comment"
    }

    patch person_url(person), params: {
      person: updated_person
    }, xhr: true

    person.reload

    assert_equal updated_person[:salutation], person.salutation
    assert_equal updated_person[:first_name], person.first_name
    assert_equal updated_person[:middle_name], person.middle_name
    assert_equal updated_person[:last_name], person.last_name
    assert_equal updated_person[:ssn], person.ssn
    assert_equal updated_person[:comment], person.comment

    assert_redirected_to person_path(Person.last)
  end

  test "should delete person" do
    assert_difference("Person.count", -1) do
      delete person_path(Person.first), xhr: true
    end

    assert_redirected_to people_path
  end
end
