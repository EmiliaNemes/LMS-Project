require "test_helper"

class UsersAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_assignment = users_assignments(:one)
  end

  test "should get index" do
    get users_assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_users_assignment_url
    assert_response :success
  end

  test "should create users_assignment" do
    assert_difference('UsersAssignment.count') do
      post users_assignments_url, params: { users_assignment: { assignment_id: @users_assignment.assignment_id, is_turned_in: @users_assignment.is_turned_in, user_id: @users_assignment.user_id } }
    end

    assert_redirected_to users_assignment_url(UsersAssignment.last)
  end

  test "should show users_assignment" do
    get users_assignment_url(@users_assignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_assignment_url(@users_assignment)
    assert_response :success
  end

  test "should update users_assignment" do
    patch users_assignment_url(@users_assignment), params: { users_assignment: { assignment_id: @users_assignment.assignment_id, is_turned_in: @users_assignment.is_turned_in, user_id: @users_assignment.user_id } }
    assert_redirected_to users_assignment_url(@users_assignment)
  end

  test "should destroy users_assignment" do
    assert_difference('UsersAssignment.count', -1) do
      delete users_assignment_url(@users_assignment)
    end

    assert_redirected_to users_assignments_url
  end
end
