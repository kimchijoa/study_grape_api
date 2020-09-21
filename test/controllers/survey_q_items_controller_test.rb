require 'test_helper'

class SurveyQItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey_q_item = survey_q_items(:one)
  end

  test "should get index" do
    get survey_q_items_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_q_item_url
    assert_response :success
  end

  test "should create survey_q_item" do
    assert_difference('SurveyQItem.count') do
      post survey_q_items_url, params: { survey_q_item: { s_sub_title: @survey_q_item.s_sub_title, s_title: @survey_q_item.s_title, survey_id: @survey_q_item.survey_id, type: @survey_q_item.type } }
    end

    assert_redirected_to survey_q_item_url(SurveyQItem.last)
  end

  test "should show survey_q_item" do
    get survey_q_item_url(@survey_q_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_q_item_url(@survey_q_item)
    assert_response :success
  end

  test "should update survey_q_item" do
    patch survey_q_item_url(@survey_q_item), params: { survey_q_item: { s_sub_title: @survey_q_item.s_sub_title, s_title: @survey_q_item.s_title, survey_id: @survey_q_item.survey_id, type: @survey_q_item.type } }
    assert_redirected_to survey_q_item_url(@survey_q_item)
  end

  test "should destroy survey_q_item" do
    assert_difference('SurveyQItem.count', -1) do
      delete survey_q_item_url(@survey_q_item)
    end

    assert_redirected_to survey_q_items_url
  end
end
