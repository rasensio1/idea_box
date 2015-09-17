class ApplicationController < ActionController::Base
  helper_method :current_user, :current_admin?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:id]) rescue nil
  end

  def current_admin?
    user = User.find(session[:id]) rescue nil
    return false if user.nil?
    return true if user.role == 1
    false
  end
end
