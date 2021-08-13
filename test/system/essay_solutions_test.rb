require "application_system_test_case"

class EssaySolutionsTest < ApplicationSystemTestCase
  setup do
    @essay_solution = essay_solutions(:one)
  end

  test "visiting the index" do
    visit essay_solutions_url
    assert_selector "h1", text: "Essay Solutions"
  end

  test "creating a Essay solution" do
    visit essay_solutions_url
    click_on "New Essay Solution"

    fill_in "Attachments", with: @essay_solution.attachments
    fill_in "Content", with: @essay_solution.content
    fill_in "Essay", with: @essay_solution.essay_id
    fill_in "Student", with: @essay_solution.student_id
    click_on "Create Essay solution"

    assert_text "Essay solution was successfully created"
    click_on "Back"
  end

  test "updating a Essay solution" do
    visit essay_solutions_url
    click_on "Edit", match: :first

    fill_in "Attachments", with: @essay_solution.attachments
    fill_in "Content", with: @essay_solution.content
    fill_in "Essay", with: @essay_solution.essay_id
    fill_in "Student", with: @essay_solution.student_id
    click_on "Update Essay solution"

    assert_text "Essay solution was successfully updated"
    click_on "Back"
  end

  test "destroying a Essay solution" do
    visit essay_solutions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Essay solution was successfully destroyed"
  end
end
