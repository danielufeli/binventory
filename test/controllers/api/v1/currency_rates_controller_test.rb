require "test_helper"

class Api::V1::CurrencyRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_currency_rate = api_v1_currency_rates(:one)
  end

  test "should get index" do
    get api_v1_currency_rates_url, as: :json
    assert_response :success
  end

  test "should create api_v1_currency_rate" do
    assert_difference("Api::V1::CurrencyRate.count") do
      post api_v1_currency_rates_url, params: { api_v1_currency_rate: { rate: @api_v1_currency_rate.rate, symbol: @api_v1_currency_rate.symbol } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_currency_rate" do
    get api_v1_currency_rate_url(@api_v1_currency_rate), as: :json
    assert_response :success
  end

  test "should update api_v1_currency_rate" do
    patch api_v1_currency_rate_url(@api_v1_currency_rate), params: { api_v1_currency_rate: { rate: @api_v1_currency_rate.rate, symbol: @api_v1_currency_rate.symbol } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_currency_rate" do
    assert_difference("Api::V1::CurrencyRate.count", -1) do
      delete api_v1_currency_rate_url(@api_v1_currency_rate), as: :json
    end

    assert_response :no_content
  end
end
