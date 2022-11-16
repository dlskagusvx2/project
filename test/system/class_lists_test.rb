require "application_system_test_case"

class ClassListsTest < ApplicationSystemTestCase
  setup do
    @class_list = class_lists(:one)
  end

  test "visiting the index" do
    visit class_lists_url
    assert_selector "h1", text: "Class Lists"
  end

  test "creating a Class list" do
    visit class_lists_url
    click_on "New Class List"

    fill_in "C name", with: @class_list.c_name
    fill_in "Classify", with: @class_list.classify
    fill_in "Credit", with: @class_list.credit
    fill_in "Department", with: @class_list.department_id
    fill_in "Lecture time", with: @class_list.lecture_time
    fill_in "Limit num", with: @class_list.limit_num
    fill_in "Professor", with: @class_list.professor_id
    fill_in "Sub num", with: @class_list.sub_num
    fill_in "Sub type", with: @class_list.sub_type
    fill_in "Target grade", with: @class_list.target_grade
    click_on "Create Class list"

    assert_text "Class list was successfully created"
    click_on "Back"
  end

  test "updating a Class list" do
    visit class_lists_url
    click_on "Edit", match: :first

    fill_in "C name", with: @class_list.c_name
    fill_in "Classify", with: @class_list.classify
    fill_in "Credit", with: @class_list.credit
    fill_in "Department", with: @class_list.department_id
    fill_in "Lecture time", with: @class_list.lecture_time
    fill_in "Limit num", with: @class_list.limit_num
    fill_in "Professor", with: @class_list.professor_id
    fill_in "Sub num", with: @class_list.sub_num
    fill_in "Sub type", with: @class_list.sub_type
    fill_in "Target grade", with: @class_list.target_grade
    click_on "Update Class list"

    assert_text "Class list was successfully updated"
    click_on "Back"
  end

  test "destroying a Class list" do
    visit class_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Class list was successfully destroyed"
  end
end
