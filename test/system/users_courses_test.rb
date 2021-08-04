require "application_system_test_case"

class UsersCoursesTest < ApplicationSystemTestCase
  setup do
    @users_course = users_courses(:one)
  end

  test "visiting the index" do
    visit users_courses_url
    assert_selector "h1", text: "Users Courses"
  end

  test "creating a Users course" do
    visit users_courses_url
    click_on "New Users Course"

    fill_in "Course", with: @users_course.course_id
    check "Is teacher" if @users_course.is_teacher
    fill_in "User", with: @users_course.user_id
    click_on "Create Users course"

    assert_text "Users course was successfully created"
    click_on "Back"
  end

  test "updating a Users course" do
    visit users_courses_url
    click_on "Edit", match: :first

    fill_in "Course", with: @users_course.course_id
    check "Is teacher" if @users_course.is_teacher
    fill_in "User", with: @users_course.user_id
    click_on "Update Users course"

    assert_text "Users course was successfully updated"
    click_on "Back"
  end

  test "destroying a Users course" do
    visit users_courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Users course was successfully destroyed"
  end
end
