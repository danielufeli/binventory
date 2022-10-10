require "test_helper"

class Api::V1::LensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_lense = api_v1_lenses(:one)
  end

  test "should get index" do
    get api_v1_lenses_url, as: :json
    assert_response :success
  end

  test "should create api_v1_lense" do
    assert_difference("Api::V1::Lense.count") do
      post api_v1_lenses_url, params: { api_v1_lense: { colour: @api_v1_lense.colour, description: @api_v1_lense.description, lens_type: @api_v1_lense.lens_type, prescription_type: @api_v1_lense.prescription_type, price: @api_v1_lense.price, stock: @api_v1_lense.stock } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_lense" do
    get api_v1_lense_url(@api_v1_lense), as: :json
    assert_response :success
  end

  test "should update api_v1_lense" do
    patch api_v1_lense_url(@api_v1_lense), params: { api_v1_lense: { colour: @api_v1_lense.colour, description: @api_v1_lense.description, lens_type: @api_v1_lense.lens_type, prescription_type: @api_v1_lense.prescription_type, price: @api_v1_lense.price, stock: @api_v1_lense.stock } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_lense" do
    assert_difference("Api::V1::Lense.count", -1) do
      delete api_v1_lense_url(@api_v1_lense), as: :json
    end

    assert_response :no_content
  end
end
