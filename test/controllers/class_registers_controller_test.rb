require "test_helper"

class ClassRegistersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_register = class_registers(:one)
  end

  test "should get index" do
    get class_registers_url
    assert_response :success
  end

  test "should get new" do
    get new_class_register_url
    assert_response :success
  end

  test "should create class_register" do
    assert_difference('ClassRegister.count') do
      post class_registers_url, params: { class_register: { assignment_id: @class_register.assignment_id, course_id: @class_register.course_id, grade: @class_register.grade, grading_teacher_id: @class_register.grading_teacher_id, student_id: @class_register.student_id } }
    end

    assert_redirected_to class_register_url(ClassRegister.last)
  end

  test "should show class_register" do
    get class_register_url(@class_register)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_register_url(@class_register)
    assert_response :success
  end

  test "should update class_register" do
    patch class_register_url(@class_register), params: { class_register: { assignment_id: @class_register.assignment_id, course_id: @class_register.course_id, grade: @class_register.grade, grading_teacher_id: @class_register.grading_teacher_id, student_id: @class_register.student_id } }
    assert_redirected_to class_register_url(@class_register)
  end

  test "should destroy class_register" do
    assert_difference('ClassRegister.count', -1) do
      delete class_register_url(@class_register)
    end

    assert_redirected_to class_registers_url
  end
end
