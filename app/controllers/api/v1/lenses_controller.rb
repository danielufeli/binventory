class Api::V1::LensesController < ApplicationController
  before_action :set_api_v1_lense, only: %i[ show update destroy ]

  # GET /api/v1/lenses
  def index
    @api_v1_lenses = Api::V1::Lense.all

    render json: @api_v1_lenses
  end

  # GET /api/v1/lenses/1
  def show
    render json: @api_v1_lense
  end

  # POST /api/v1/lenses
  def create
    @api_v1_lense = Api::V1::Lense.new(api_v1_lense_params)

    if @api_v1_lense.save
      render json: @api_v1_lense, status: :created, location: @api_v1_lense
    else
      render json: @api_v1_lense.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/lenses/1
  def update
    if @api_v1_lense.update(api_v1_lense_params)
      render json: @api_v1_lense
    else
      render json: @api_v1_lense.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/lenses/1
  def destroy
    @api_v1_lense.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_lense
      @api_v1_lense = Api::V1::Lense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_lense_params
      params.require(:api_v1_lense).permit(:colour, :description, :prescription_type, :lens_type, :stock, :price)
    end
end
