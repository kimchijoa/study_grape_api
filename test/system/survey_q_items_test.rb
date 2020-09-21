require "application_system_test_case"

class SurveyQItemsTest < ApplicationSystemTestCase
  setup do
    @survey_q_item = survey_q_items(:one)
  end

  test "visiting the index" do
    visit survey_q_items_url
    assert_selector "h1", text: "Survey Q Items"
  end

  test "creating a Survey q item" do
    visit survey_q_items_url
    click_on "New Survey Q Item"

    fill_in "S sub title", with: @survey_q_item.s_sub_title
    fill_in "S title", with: @survey_q_item.s_title
    fill_in "Survey", with: @survey_q_item.survey_id
    fill_in "Type", with: @survey_q_item.type
    click_on "Create Survey q item"

    assert_text "Survey q item was successfully created"
    click_on "Back"
  end

  test "updating a Survey q item" do
    visit survey_q_items_url
    click_on "Edit", match: :first

    fill_in "S sub title", with: @survey_q_item.s_sub_title
    fill_in "S title", with: @survey_q_item.s_title
    fill_in "Survey", with: @survey_q_item.survey_id
    fill_in "Type", with: @survey_q_item.type
    click_on "Update Survey q item"

    assert_text "Survey q item was successfully updated"
    click_on "Back"
  end

  test "destroying a Survey q item" do
    visit survey_q_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Survey q item was successfully destroyed"
  end
end
