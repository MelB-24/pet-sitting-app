require "application_system_test_case"

class BookingsTest < ApplicationSystemTestCase
  setup do
    @booking = bookings(:one)
  end

  test "visiting the index" do
    visit bookings_url
    assert_selector "h1", text: "Bookings"
  end

  test "creating a Booking" do
    visit bookings_url
    click_on "New Booking"

    fill_in "Date", with: @booking.date
    fill_in "Number of dogs", with: @booking.number_of_dogs
    fill_in "Owner", with: @booking.owner_id
    fill_in "Sitter", with: @booking.sitter_id
    fill_in "Time finishes", with: @booking.time_finishes
    fill_in "Time starts", with: @booking.time_starts
    click_on "Create Booking"

    assert_text "Booking was successfully created"
    click_on "Back"
  end

  test "updating a Booking" do
    visit bookings_url
    click_on "Edit", match: :first

    fill_in "Date", with: @booking.date
    fill_in "Number of dogs", with: @booking.number_of_dogs
    fill_in "Owner", with: @booking.owner_id
    fill_in "Sitter", with: @booking.sitter_id
    fill_in "Time finishes", with: @booking.time_finishes
    fill_in "Time starts", with: @booking.time_starts
    click_on "Update Booking"

    assert_text "Booking was successfully updated"
    click_on "Back"
  end

  test "destroying a Booking" do
    visit bookings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Booking was successfully destroyed"
  end
end
