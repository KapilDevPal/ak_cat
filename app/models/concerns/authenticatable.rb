module Authenticatable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
    helper_method :user_signed_in?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def require_authentication
    unless user_signed_in?
      redirect_to main_app.sign_in_path, alert: "Please sign in to continue."
    end
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end
end 