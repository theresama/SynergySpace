class ApplicationController < ActionController::Base
  skip_before_filter :verify_authenticity_token
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
  	if current_user.admin?
  		dashboard_path
  	else
  		listings_path
  	end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :occupation, :avatar, :skills, :interests) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email,  :password, :password_confirmation, :current_password, :occupation, :skills, :interests, :avatar) }
  end

end
