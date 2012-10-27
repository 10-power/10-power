class Admin::ApplicationController < ActionController::Base
  before_filter :authenticate

  protect_from_forgery

  layout 'admin'

  helper_method :current_user

  private

  def current_user
    @current_user || false
  end

  def authenticate
    if user = authenticate_with_http_basic { |u, p| user = User.find_by_email(u); user && user.authenticate(p) }
      @current_user = user
    else
      request_http_basic_authentication
    end
  end
end
