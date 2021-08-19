require "test_helper"

class QuizSolutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz_solution = quiz_solutions(:one)
  end

  test "should get index" do
    get quiz_solutions_url
    assert_response :success
  end

  test "should get new" do
    get new_quiz_solution_url
    assert_response :success
  end

  test "should create quiz_solution" do
    assert_difference('QuizSolution.count') do
      post quiz_solutions_url, params: { quiz_solution: { grade: @quiz_solution.grade, quize_id: @quiz_solution.quize_id, student_id: @quiz_solution.student_id } }
    end

    assert_redirected_to quiz_solution_url(QuizSolution.last)
  end

  test "should show quiz_solution" do
    get quiz_solution_url(@quiz_solution)
    assert_response :success
  end

  test "should get edit" do
    get edit_quiz_solution_url(@quiz_solution)
    assert_response :success
  end

  test "should update quiz_solution" do
    patch quiz_solution_url(@quiz_solution), params: { quiz_solution: { grade: @quiz_solution.grade, quize_id: @quiz_solution.quize_id, student_id: @quiz_solution.student_id } }
    assert_redirected_to quiz_solution_url(@quiz_solution)
  end

  test "should destroy quiz_solution" do
    assert_difference('QuizSolution.count', -1) do
      delete quiz_solution_url(@quiz_solution)
    end

    assert_redirected_to quiz_solutions_url
  end
end
