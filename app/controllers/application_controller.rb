# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Search
  include Handler
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Handler::RequestError do |exception|
    error_handler(exception)
  end

  private

  def configure_permitted_parameters
    if resource_class == Customer
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name company_phone mobile_phone])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name company_phone mobile_phone])
    elsif resource_class == CompanyOwner
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name phone])
    end
  end

  def error_handler(exception)
    flash[:error] = exception.message
    redirect_to root_path
  end
end
