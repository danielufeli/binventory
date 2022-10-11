class Api::V1::GlassesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_v1_glass, only: %i[ show update destroy ]

  # GET /api/v1/glasses
  def index
    @api_v1_glasses = Api::V1::Glass.where(user_id: current_user.id)
    
    render json: @api_v1_glasses.to_json(include: [:user, :frame])
  end

  # GET /api/v1/glasses/1
  def show
    render json: @api_v1_glass
  end

  # POST /api/v1/glasses
  def create
    @api_v1_glass = Api::V1::Glass.new(api_v1_glass_params)
    @frame = Api::V1::Frame.find(api_v1_glass_params[:api_v1_frame_id])
    @lense = Api::V1::Lense.find(api_v1_glass_params[:api_v1_lense_id])
    @currency = Api::V1::CurrencyRate.find(api_v1_glass_params[:api_v1_currency_rate_id])

    if @frame.stock == 0 || @lense.stock == 0
      render json: {error: "Out of stock"}, status: :unprocessable_entity
    else
      @api_v1_glass.user_id = current_user.id
      @api_v1_glass.api_v1_frame_id = @frame.id
      @api_v1_glass.api_v1_lense_id = @lense.id
      @api_v1_glass.api_v1_currency_rate_id = @currency.id
      
      @frame_price = @frame.price * @currency.rate
      @lense_price = @lense.price * @currency.rate
      
      @api_v1_glass.total = @frame_price + @lense_price
    end

    if @api_v1_glass.save
      @frame.stock -= 1
      @lense.stock -= 1
      @frame.save
      @lense.save
      render json: @api_v1_glass, status: :created, location: @api_v1_glass
    else
      render json: @api_v1_glass.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/glasses/1
  def update
    if @api_v1_glass.update(api_v1_glass_params)
      render json: @api_v1_glass
    else
      render json: @api_v1_glass.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/glasses/1
  def destroy
    @api_v1_glass.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_glass
      @api_v1_glass = Api::V1::Glass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_glass_params
      params.require(:api_v1_glass).permit(:user_id, :total, :api_v1_frame_id, :api_v1_lense_id, :api_v1_currency_rate_id)
    end
end
