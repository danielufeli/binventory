require "test_helper"

class Api::V1::GlassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_glass = api_v1_glasses(:one)
  end

  test "should get index" do
    get api_v1_glasses_url, as: :json
    assert_response :success
  end

  test "should create api_v1_glass" do
    assert_difference("Api::V1::Glass.count") do
      post api_v1_glasses_url, params: { api_v1_glass: { currency_id: @api_v1_glass.currency_id, frame_id: @api_v1_glass.frame_id, lense_id: @api_v1_glass.lense_id, total: @api_v1_glass.total, user_id: @api_v1_glass.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_glass" do
    get api_v1_glass_url(@api_v1_glass), as: :json
    assert_response :success
  end

  test "should update api_v1_glass" do
    patch api_v1_glass_url(@api_v1_glass), params: { api_v1_glass: { currency_id: @api_v1_glass.currency_id, frame_id: @api_v1_glass.frame_id, lense_id: @api_v1_glass.lense_id, total: @api_v1_glass.total, user_id: @api_v1_glass.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_glass" do
    assert_difference("Api::V1::Glass.count", -1) do
      delete api_v1_glass_url(@api_v1_glass), as: :json
    end

    assert_response :no_content
  end
end
