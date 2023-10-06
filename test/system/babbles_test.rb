require "application_system_test_case"

class BabblesTest < ApplicationSystemTestCase
  setup do
    @babble = babbles(:one)
  end

  test "visiting the index" do
    visit babbles_url
    assert_selector "h1", text: "Babbles"
  end

  test "should create babble" do
    visit babbles_url
    click_on "New babble"

    fill_in "Babble", with: @babble.babble
    click_on "Create Babble"

    assert_text "Babble was successfully created"
    click_on "Back"
  end

  test "should update Babble" do
    visit babble_url(@babble)
    click_on "Edit this babble", match: :first

    fill_in "Babble", with: @babble.babble
    click_on "Update Babble"

    assert_text "Babble was successfully updated"
    click_on "Back"
  end

  test "should destroy Babble" do
    visit babble_url(@babble)
    click_on "Destroy this babble", match: :first

    assert_text "Babble was successfully destroyed"
  end
end
