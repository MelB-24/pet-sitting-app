require "application_system_test_case"

class SittersTest < ApplicationSystemTestCase
  setup do
    @sitter = sitters(:one)
  end

  test "visiting the index" do
    visit sitters_url
    assert_selector "h1", text: "Sitters"
  end

  test "creating a Sitter" do
    visit sitters_url
    click_on "New Sitter"

    fill_in "Address", with: @sitter.address
    fill_in "Business name", with: @sitter.business_name
    fill_in "Name", with: @sitter.name
    fill_in "Postcode", with: @sitter.postcode
    fill_in "Price", with: @sitter.price
    fill_in "Sitter user", with: @sitter.sitter_user_id
    fill_in "State", with: @sitter.state
    fill_in "Suburb", with: @sitter.suburb
    click_on "Create Sitter"

    assert_text "Sitter was successfully created"
    click_on "Back"
  end

  test "updating a Sitter" do
    visit sitters_url
    click_on "Edit", match: :first

    fill_in "Address", with: @sitter.address
    fill_in "Business name", with: @sitter.business_name
    fill_in "Name", with: @sitter.name
    fill_in "Postcode", with: @sitter.postcode
    fill_in "Price", with: @sitter.price
    fill_in "Sitter user", with: @sitter.sitter_user_id
    fill_in "State", with: @sitter.state
    fill_in "Suburb", with: @sitter.suburb
    click_on "Update Sitter"

    assert_text "Sitter was successfully updated"
    click_on "Back"
  end

  test "destroying a Sitter" do
    visit sitters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sitter was successfully destroyed"
  end
end
