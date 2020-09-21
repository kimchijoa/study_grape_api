require 'test_helper'

class SurveyQItemListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey_q_item_list = survey_q_item_lists(:one)
  end

  test "should get index" do
    get survey_q_item_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_q_item_list_url
    assert_response :success
  end

  test "should create survey_q_item_list" do
    assert_difference('SurveyQItemList.count') do
      post survey_q_item_lists_url, params: { survey_q_item_list: { item: @survey_q_item_list.item, survey_q_item_id: @survey_q_item_list.survey_q_item_id } }
    end

    assert_redirected_to survey_q_item_list_url(SurveyQItemList.last)
  end

  test "should show survey_q_item_list" do
    get survey_q_item_list_url(@survey_q_item_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_q_item_list_url(@survey_q_item_list)
    assert_response :success
  end

  test "should update survey_q_item_list" do
    patch survey_q_item_list_url(@survey_q_item_list), params: { survey_q_item_list: { item: @survey_q_item_list.item, survey_q_item_id: @survey_q_item_list.survey_q_item_id } }
    assert_redirected_to survey_q_item_list_url(@survey_q_item_list)
  end

  test "should destroy survey_q_item_list" do
    assert_difference('SurveyQItemList.count', -1) do
      delete survey_q_item_list_url(@survey_q_item_list)
    end

    assert_redirected_to survey_q_item_lists_url
  end
end
