require "application_system_test_case"

class QuizesTest < ApplicationSystemTestCase
  setup do
    @quize = quizes(:one)
  end

  test "visiting the index" do
    visit quizes_url
    assert_selector "h1", text: "Quizes"
  end

  test "creating a Quize" do
    visit quizes_url
    click_on "New Quize"

    fill_in "Description", with: @quize.description
    fill_in "Name", with: @quize.name
    fill_in "Student", with: @quize.student_id
    click_on "Create Quize"

    assert_text "Quize was successfully created"
    click_on "Back"
  end

  test "updating a Quize" do
    visit quizes_url
    click_on "Edit", match: :first

    fill_in "Description", with: @quize.description
    fill_in "Name", with: @quize.name
    fill_in "Student", with: @quize.student_id
    click_on "Update Quize"

    assert_text "Quize was successfully updated"
    click_on "Back"
  end

  test "destroying a Quize" do
    visit quizes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quize was successfully destroyed"
  end
end
