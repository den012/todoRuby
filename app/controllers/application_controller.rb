class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    @current_user ||= UserSession.find&.record
  end
end