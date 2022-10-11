class Api::V1::FramesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_v1_frame, only: %i[ show update destroy ]

  # GET /api/v1/frames
  def index
    @api_v1_frames = Api::V1::Frame.all
    if current_user.admin?
    render json: @api_v1_frames
    else
      render json: @api_v1_frames.where(status: 'active')
    end    
  end

  # GET /api/v1/frames/1
  def show
    render json: @api_v1_frame
  end

  # POST /api/v1/frames
  def create
    if current_user.admin?

    @api_v1_frame = Api::V1::Frame.new(api_v1_frame_params)

    if @api_v1_frame.save
      render json: @api_v1_frame, status: :created, location: @api_v1_frame
    else
      render json: @api_v1_frame.errors, status: :unprocessable_entity
    end

    else
      render json: {error: "You are not authorized to create a frame"}, status: :unauthorized
    end
  end

  # PATCH/PUT /api/v1/frames/1
  def update
    if current_user.admin?

    if @api_v1_frame.update(api_v1_frame_params)
      render json: @api_v1_frame
    else
      render json: @api_v1_frame.errors, status: :unprocessable_entity
    end

    else
      render json: {error: "You are not authorized to update a frame"}, status: :unauthorized
    end
  end

  # DELETE /api/v1/frames/1
  def destroy
    if current_user.admin?

    @api_v1_frame.destroy
  
    else
      render json: {error: "You are not authorized to update a frame"}, status: :unauthorized
    end
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
