# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_generate_session_id'
#	protect_from_forgery with: :exception

#  protected
#
#  def configure_permitted_parameters
#    devise_parameter_sanitizer.for(:sign_up) << [:full_name, :password_confirmation]
#    devise_parameter_sanitizer.for(:sign_in) << [:email, :remember_me]
#  end
end
