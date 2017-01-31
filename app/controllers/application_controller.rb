class ApplicationController < ActionController::Base

  # STATES = ['AL', 'AK', 'AZ','AR', 'CA', 'CO','CT', 'DE', 'FL','GA', 'HI', 'ID', 'IL', 'IN','IA', 'KS', 'KY','LA', 'ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY']
  protect_from_forgery unless: -> { request.format.json? }

  before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :email, :baker, :zip, :state, :city, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :email])
  end
end
