require "application_system_test_case"

class DogsTest < ApplicationSystemTestCase
  setup do
    @dog = dogs(:one)
  end

  test "visiting the index" do
    visit dogs_url
    assert_selector "h1", text: "Dogs"
  end

  test "creating a Dog" do
    visit dogs_url
    click_on "New Dog"

    fill_in "Bio", with: @dog.bio
    fill_in "Breed", with: @dog.breed
    fill_in "Date of birth", with: @dog.date_of_birth
    fill_in "Microchip number", with: @dog.microchip_number
    fill_in "Name", with: @dog.name
    fill_in "Owner", with: @dog.owner_id
    fill_in "Sex", with: @dog.sex
    click_on "Create Dog"

    assert_text "Dog was successfully created"
    click_on "Back"
  end

  test "updating a Dog" do
    visit dogs_url
    click_on "Edit", match: :first

    fill_in "Bio", with: @dog.bio
    fill_in "Breed", with: @dog.breed
    fill_in "Date of birth", with: @dog.date_of_birth
    fill_in "Microchip number", with: @dog.microchip_number
    fill_in "Name", with: @dog.name
    fill_in "Owner", with: @dog.owner_id
    fill_in "Sex", with: @dog.sex
    click_on "Update Dog"

    assert_text "Dog was successfully updated"
    click_on "Back"
  end

  test "destroying a Dog" do
    visit dogs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dog was successfully destroyed"
  end
end
