class ApplicationController < ActionController::Base
  include Search
  include Handler
  include User

  rescue_from Handler::RequestError do |exception|
    error_handler(exception)
  end

  private

  def error_handler(exception)
    flash[:error] = exception.message
    redirect_to root_path
  end
end
