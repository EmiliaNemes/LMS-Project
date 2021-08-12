require "application_system_test_case"

class UsersAssignmentsTest < ApplicationSystemTestCase
  setup do
    @users_assignment = users_assignments(:one)
  end

  test "visiting the index" do
    visit users_assignments_url
    assert_selector "h1", text: "Users Assignments"
  end

  test "creating a Users assignment" do
    visit users_assignments_url
    click_on "New Users Assignment"

    fill_in "Assignment", with: @users_assignment.assignment_id
    check "Is turned in" if @users_assignment.is_turned_in
    fill_in "User", with: @users_assignment.user_id
    click_on "Create Users assignment"

    assert_text "Users assignment was successfully created"
    click_on "Back"
  end

  test "updating a Users assignment" do
    visit users_assignments_url
    click_on "Edit", match: :first

    fill_in "Assignment", with: @users_assignment.assignment_id
    check "Is turned in" if @users_assignment.is_turned_in
    fill_in "User", with: @users_assignment.user_id
    click_on "Update Users assignment"

    assert_text "Users assignment was successfully updated"
    click_on "Back"
  end

  test "destroying a Users assignment" do
    visit users_assignments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Users assignment was successfully destroyed"
  end
end
