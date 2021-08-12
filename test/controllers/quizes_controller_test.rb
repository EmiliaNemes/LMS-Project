require "test_helper"

class QuizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quize = quizes(:one)
  end

  test "should get index" do
    get quizes_url
    assert_response :success
  end

  test "should get new" do
    get new_quize_url
    assert_response :success
  end

  test "should create quize" do
    assert_difference('Quize.count') do
      post quizes_url, params: { quize: { description: @quize.description, name: @quize.name, student_id: @quize.student_id } }
    end

    assert_redirected_to quize_url(Quize.last)
  end

  test "should show quize" do
    get quize_url(@quize)
    assert_response :success
  end

  test "should get edit" do
    get edit_quize_url(@quize)
    assert_response :success
  end

  test "should update quize" do
    patch quize_url(@quize), params: { quize: { description: @quize.description, name: @quize.name, student_id: @quize.student_id } }
    assert_redirected_to quize_url(@quize)
  end

  test "should destroy quize" do
    assert_difference('Quize.count', -1) do
      delete quize_url(@quize)
    end

    assert_redirected_to quizes_url
  end
end
