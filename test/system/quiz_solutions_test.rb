require "application_system_test_case"

class QuizSolutionsTest < ApplicationSystemTestCase
  setup do
    @quiz_solution = quiz_solutions(:one)
  end

  test "visiting the index" do
    visit quiz_solutions_url
    assert_selector "h1", text: "Quiz Solutions"
  end

  test "creating a Quiz solution" do
    visit quiz_solutions_url
    click_on "New Quiz Solution"

    fill_in "Grade", with: @quiz_solution.grade
    fill_in "Quize", with: @quiz_solution.quize_id
    fill_in "Student", with: @quiz_solution.student_id
    click_on "Create Quiz solution"

    assert_text "Quiz solution was successfully created"
    click_on "Back"
  end

  test "updating a Quiz solution" do
    visit quiz_solutions_url
    click_on "Edit", match: :first

    fill_in "Grade", with: @quiz_solution.grade
    fill_in "Quize", with: @quiz_solution.quize_id
    fill_in "Student", with: @quiz_solution.student_id
    click_on "Update Quiz solution"

    assert_text "Quiz solution was successfully updated"
    click_on "Back"
  end

  test "destroying a Quiz solution" do
    visit quiz_solutions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quiz solution was successfully destroyed"
  end
end
