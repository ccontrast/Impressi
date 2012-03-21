class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :register_guest_user
  
  private
  
  def register_guest_user
    if current_user
      if session[:guest_id]
        session.delete :guest_id
      end
    else
      session[:guest_id] ||= session[:guest_id] = rand(9999999)
    end
  end
end
