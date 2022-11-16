require "application_system_test_case"

class BbbsTest < ApplicationSystemTestCase
  setup do
    @bbb = bbbs(:one)
  end

  test "visiting the index" do
    visit bbbs_url
    assert_selector "h1", text: "Bbbs"
  end

  test "creating a Bbb" do
    visit bbbs_url
    click_on "New Bbb"

    fill_in "Department", with: @bbb.department_id
    click_on "Create Bbb"

    assert_text "Bbb was successfully created"
    click_on "Back"
  end

  test "updating a Bbb" do
    visit bbbs_url
    click_on "Edit", match: :first

    fill_in "Department", with: @bbb.department_id
    click_on "Update Bbb"

    assert_text "Bbb was successfully updated"
    click_on "Back"
  end

  test "destroying a Bbb" do
    visit bbbs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bbb was successfully destroyed"
  end
end
