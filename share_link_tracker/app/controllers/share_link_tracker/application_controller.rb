module ShareLinkTracker
  class ApplicationController < ::ApplicationController
    before_action :require_authentication

    private

    def require_authentication
      unless authenticated?
        redirect_to main_app.sign_in_path, alert: "Please sign in to access link tracking."
      end
    end

    def authenticated?
      session[:user_id].present?
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
  end
end
