module MarriageProfiles
  class ApplicationController < ::ApplicationController
    include Authenticatable
    helper MarriageProfiles::Engine.helpers

    before_action :authenticate_user!

    private

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def user_signed_in?
      current_user.present?
    end
    helper_method :user_signed_in?

    def authenticate_user!
      unless user_signed_in?
        session[:return_to] = request.fullpath
        redirect_to main_app.sign_in_path, alert: "Please sign in to continue"
      end
    end
  end
end
