require "application_system_test_case"

class QuizAnswersTest < ApplicationSystemTestCase
  setup do
    @quiz_answer = quiz_answers(:one)
  end

  test "visiting the index" do
    visit quiz_answers_url
    assert_selector "h1", text: "Quiz Answers"
  end

  test "creating a Quiz answer" do
    visit quiz_answers_url
    click_on "New Quiz Answer"

    fill_in "Answer", with: @quiz_answer.answer
    check "Is correct" if @quiz_answer.is_correct
    fill_in "Question", with: @quiz_answer.question_id
    click_on "Create Quiz answer"

    assert_text "Quiz answer was successfully created"
    click_on "Back"
  end

  test "updating a Quiz answer" do
    visit quiz_answers_url
    click_on "Edit", match: :first

    fill_in "Answer", with: @quiz_answer.answer
    check "Is correct" if @quiz_answer.is_correct
    fill_in "Question", with: @quiz_answer.question_id
    click_on "Update Quiz answer"

    assert_text "Quiz answer was successfully updated"
    click_on "Back"
  end

  test "destroying a Quiz answer" do
    visit quiz_answers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quiz answer was successfully destroyed"
  end
end
