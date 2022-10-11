class Api::V1::CurrencyRatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_v1_currency_rate, only: %i[ show update destroy ]

  # GET /api/v1/currency_rates
  def index
    @api_v1_currency_rates = Api::V1::CurrencyRate.all

    render json: @api_v1_currency_rates
  end

  # GET /api/v1/currency_rates/1
  def show
    render json: @api_v1_currency_rate
  end

  # POST /api/v1/currency_rates
  def create
    @api_v1_currency_rate = Api::V1::CurrencyRate.new(api_v1_currency_rate_params)

    if @api_v1_currency_rate.save
      render json: @api_v1_currency_rate, status: :created, location: @api_v1_currency_rate
    else
      render json: @api_v1_currency_rate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/currency_rates/1
  def update
    if @api_v1_currency_rate.update(api_v1_currency_rate_params)
      render json: @api_v1_currency_rate
    else
      render json: @api_v1_currency_rate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/currency_rates/1
  def destroy
    @api_v1_currency_rate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_currency_rate
      @api_v1_currency_rate = Api::V1::CurrencyRate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_currency_rate_params
      params.require(:api_v1_currency_rate).permit(:symbol, :rate)
    end
end
