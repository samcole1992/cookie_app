class ApplicationController < ActionController::Base

  protect_from_forgery unless: -> { request.format.json? }

  before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :baker, :state, :city, :street, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :email])
  end
end
