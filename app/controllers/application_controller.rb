class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:role, :nickname, :name, :surname]
    devise_parameter_sanitizer.for(:account_update) << [:role, :nickname, :name, :surname]
  end

end
