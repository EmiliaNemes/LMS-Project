require "application_system_test_case"

class ClassRegistersTest < ApplicationSystemTestCase
  setup do
    @class_register = class_registers(:one)
  end

  test "visiting the index" do
    visit class_registers_url
    assert_selector "h1", text: "Class Registers"
  end

  test "creating a Class register" do
    visit class_registers_url
    click_on "New Class Register"

    fill_in "Assignment", with: @class_register.assignment_id
    fill_in "Course", with: @class_register.course_id
    fill_in "Grade", with: @class_register.grade
    fill_in "Grading teacher", with: @class_register.grading_teacher_id
    fill_in "Student", with: @class_register.student_id
    click_on "Create Class register"

    assert_text "Class register was successfully created"
    click_on "Back"
  end

  test "updating a Class register" do
    visit class_registers_url
    click_on "Edit", match: :first

    fill_in "Assignment", with: @class_register.assignment_id
    fill_in "Course", with: @class_register.course_id
    fill_in "Grade", with: @class_register.grade
    fill_in "Grading teacher", with: @class_register.grading_teacher_id
    fill_in "Student", with: @class_register.student_id
    click_on "Update Class register"

    assert_text "Class register was successfully updated"
    click_on "Back"
  end

  test "destroying a Class register" do
    visit class_registers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Class register was successfully destroyed"
  end
end
