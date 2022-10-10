class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?

  private

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :role) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :role)
    end
  end
end
