class Admin::ApplicationController < ActionController::Base
  http_basic_authenticate_with :name => "change", :password => "theworld"

  protect_from_forgery

  layout 'admin'
end
