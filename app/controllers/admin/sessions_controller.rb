class Admin::SessionsController < ApplicationController
  layout 'admin_login'
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  
  def new
    # Check if we already have an admin user
    if AdminUser.count == 0
      # Create a default admin user if none exists
      AdminUser.create!(
        email: 'admin@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      flash.now[:notice] = "Default admin created with email: admin@example.com and password: password123"
    end
  end

  def create
    admin_user = AdminUser.find_by(email: params[:email].downcase.strip)
    
    if admin_user && admin_user.valid_password?(params[:password])
      session[:admin_user_id] = admin_user.id
      redirect_to admin_root_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:admin_user_id)
    reset_session
    redirect_to new_admin_user_session_path, notice: "Logged out successfully!"
  end
end 