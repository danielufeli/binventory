class Api::V1::FramesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_v1_frame, only: %i[ show update destroy ]

  # GET /api/v1/frames
  def index
    @api_v1_frames = Api::V1::Frame.all

    render json: @api_v1_frames
  end

  # GET /api/v1/frames/1
  def show
    render json: @api_v1_frame
  end

  # POST /api/v1/frames
  def create
    @api_v1_frame = Api::V1::Frame.new(api_v1_frame_params)

    if @api_v1_frame.save
      render json: @api_v1_frame, status: :created, location: @api_v1_frame
    else
      render json: @api_v1_frame.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/frames/1
  def update
    if @api_v1_frame.update(api_v1_frame_params)
      render json: @api_v1_frame
    else
      render json: @api_v1_frame.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/frames/1
  def destroy
    @api_v1_frame.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_frame
      @api_v1_frame = Api::V1::Frame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_frame_params
      params.require(:api_v1_frame).permit(:name, :description, :status, :stock, :price)
    end
end
