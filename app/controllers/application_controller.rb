class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protect_from_forgery with: :exception

  # Don't require authentication globally
  # before_action :authenticate_user!

  helper_method :current_admin_user, :current_user, :user_signed_in?

  # ActiveAdmin authentication
  def authenticate_admin_user!
    redirect_to new_admin_user_session_path unless current_admin_user
  end
  
  def current_admin_user
    @current_admin_user ||= AdminUser.find_by(id: session[:admin_user_id])
  end

  # Regular user authentication
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !!current_user
  end

  def authenticate_user!
    unless user_signed_in?
      flash[:alert] = "Please sign in to continue"
      redirect_to user_sign_in_path
    end
  end
end