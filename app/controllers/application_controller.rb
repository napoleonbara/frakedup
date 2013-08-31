class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  protected
    
    def certify_logged_in
      not_found unless logged_in?
    end

    def certify_admin
      not_found unless admin?
    end 

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
end
