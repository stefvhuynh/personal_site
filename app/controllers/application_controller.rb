class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def sign_in!(user)
    session[:token] = user.reset_session_token!
    @current_user = user
  end
  
  def sign_out!
    session[:token] = nil
    current_user.reset_session_token!
    @current_user = nil
  end
  
  def signed_in?
    !!current_user
  end
  
  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end
  
end
