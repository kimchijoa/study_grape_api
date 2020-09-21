require "application_system_test_case"

class SurveyQItemListsTest < ApplicationSystemTestCase
  setup do
    @survey_q_item_list = survey_q_item_lists(:one)
  end

  test "visiting the index" do
    visit survey_q_item_lists_url
    assert_selector "h1", text: "Survey Q Item Lists"
  end

  test "creating a Survey q item list" do
    visit survey_q_item_lists_url
    click_on "New Survey Q Item List"

    fill_in "Item", with: @survey_q_item_list.item
    fill_in "Survey q item", with: @survey_q_item_list.survey_q_item_id
    click_on "Create Survey q item list"

    assert_text "Survey q item list was successfully created"
    click_on "Back"
  end

  test "updating a Survey q item list" do
    visit survey_q_item_lists_url
    click_on "Edit", match: :first

    fill_in "Item", with: @survey_q_item_list.item
    fill_in "Survey q item", with: @survey_q_item_list.survey_q_item_id
    click_on "Update Survey q item list"

    assert_text "Survey q item list was successfully updated"
    click_on "Back"
  end

  test "destroying a Survey q item list" do
    visit survey_q_item_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Survey q item list was successfully destroyed"
  end
end
