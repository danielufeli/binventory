require "test_helper"

class Api::V1::FramesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_frame = api_v1_frames(:one)
  end

  test "should get index" do
    get api_v1_frames_url, as: :json
    assert_response :success
  end

  test "should create api_v1_frame" do
    assert_difference("Api::V1::Frame.count") do
      post api_v1_frames_url, params: { api_v1_frame: { description: @api_v1_frame.description, name: @api_v1_frame.name, price: @api_v1_frame.price, status: @api_v1_frame.status, stock: @api_v1_frame.stock } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_frame" do
    get api_v1_frame_url(@api_v1_frame), as: :json
    assert_response :success
  end

  test "should update api_v1_frame" do
    patch api_v1_frame_url(@api_v1_frame), params: { api_v1_frame: { description: @api_v1_frame.description, name: @api_v1_frame.name, price: @api_v1_frame.price, status: @api_v1_frame.status, stock: @api_v1_frame.stock } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_frame" do
    assert_difference("Api::V1::Frame.count", -1) do
      delete api_v1_frame_url(@api_v1_frame), as: :json
    end

    assert_response :no_content
  end
end
