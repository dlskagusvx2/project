require 'test_helper'

class ClassListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_list = class_lists(:one)
  end

  test "should get index" do
    get class_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_class_list_url
    assert_response :success
  end

  test "should create class_list" do
    assert_difference('ClassList.count') do
      post class_lists_url, params: { class_list: { c_name: @class_list.c_name, classify: @class_list.classify, credit: @class_list.credit, department_id: @class_list.department_id, lecture_time: @class_list.lecture_time, limit_num: @class_list.limit_num, professor_id: @class_list.professor_id, sub_num: @class_list.sub_num, sub_type: @class_list.sub_type, target_grade: @class_list.target_grade } }
    end

    assert_redirected_to class_list_url(ClassList.last)
  end

  test "should show class_list" do
    get class_list_url(@class_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_list_url(@class_list)
    assert_response :success
  end

  test "should update class_list" do
    patch class_list_url(@class_list), params: { class_list: { c_name: @class_list.c_name, classify: @class_list.classify, credit: @class_list.credit, department_id: @class_list.department_id, lecture_time: @class_list.lecture_time, limit_num: @class_list.limit_num, professor_id: @class_list.professor_id, sub_num: @class_list.sub_num, sub_type: @class_list.sub_type, target_grade: @class_list.target_grade } }
    assert_redirected_to class_list_url(@class_list)
  end

  test "should destroy class_list" do
    assert_difference('ClassList.count', -1) do
      delete class_list_url(@class_list)
    end

    assert_redirected_to class_lists_url
  end
end
