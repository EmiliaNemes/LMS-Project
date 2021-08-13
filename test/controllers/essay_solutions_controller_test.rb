require "test_helper"

class EssaySolutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @essay_solution = essay_solutions(:one)
  end

  test "should get index" do
    get essay_solutions_url
    assert_response :success
  end

  test "should get new" do
    get new_essay_solution_url
    assert_response :success
  end

  test "should create essay_solution" do
    assert_difference('EssaySolution.count') do
      post essay_solutions_url, params: { essay_solution: { attachments: @essay_solution.attachments, content: @essay_solution.content, essay_id: @essay_solution.essay_id, student_id: @essay_solution.student_id } }
    end

    assert_redirected_to essay_solution_url(EssaySolution.last)
  end

  test "should show essay_solution" do
    get essay_solution_url(@essay_solution)
    assert_response :success
  end

  test "should get edit" do
    get edit_essay_solution_url(@essay_solution)
    assert_response :success
  end

  test "should update essay_solution" do
    patch essay_solution_url(@essay_solution), params: { essay_solution: { attachments: @essay_solution.attachments, content: @essay_solution.content, essay_id: @essay_solution.essay_id, student_id: @essay_solution.student_id } }
    assert_redirected_to essay_solution_url(@essay_solution)
  end

  test "should destroy essay_solution" do
    assert_difference('EssaySolution.count', -1) do
      delete essay_solution_url(@essay_solution)
    end

    assert_redirected_to essay_solutions_url
  end
end
