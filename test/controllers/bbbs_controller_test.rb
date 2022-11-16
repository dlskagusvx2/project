require 'test_helper'

class BbbsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bbb = bbbs(:one)
  end

  test "should get index" do
    get bbbs_url
    assert_response :success
  end

  test "should get new" do
    get new_bbb_url
    assert_response :success
  end

  test "should create bbb" do
    assert_difference('Bbb.count') do
      post bbbs_url, params: { bbb: { department_id: @bbb.department_id } }
    end

    assert_redirected_to bbb_url(Bbb.last)
  end

  test "should show bbb" do
    get bbb_url(@bbb)
    assert_response :success
  end

  test "should get edit" do
    get edit_bbb_url(@bbb)
    assert_response :success
  end

  test "should update bbb" do
    patch bbb_url(@bbb), params: { bbb: { department_id: @bbb.department_id } }
    assert_redirected_to bbb_url(@bbb)
  end

  test "should destroy bbb" do
    assert_difference('Bbb.count', -1) do
      delete bbb_url(@bbb)
    end

    assert_redirected_to bbbs_url
  end
end
