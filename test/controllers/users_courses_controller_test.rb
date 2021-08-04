require "test_helper"

class UsersCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_course = users_courses(:one)
  end

  test "should get index" do
    get users_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_users_course_url
    assert_response :success
  end

  test "should create users_course" do
    assert_difference('UsersCourse.count') do
      post users_courses_url, params: { users_course: { course_id: @users_course.course_id, is_teacher: @users_course.is_teacher, user_id: @users_course.user_id } }
    end

    assert_redirected_to users_course_url(UsersCourse.last)
  end

  test "should show users_course" do
    get users_course_url(@users_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_course_url(@users_course)
    assert_response :success
  end

  test "should update users_course" do
    patch users_course_url(@users_course), params: { users_course: { course_id: @users_course.course_id, is_teacher: @users_course.is_teacher, user_id: @users_course.user_id } }
    assert_redirected_to users_course_url(@users_course)
  end

  test "should destroy users_course" do
    assert_difference('UsersCourse.count', -1) do
      delete users_course_url(@users_course)
    end

    assert_redirected_to users_courses_url
  end
end
