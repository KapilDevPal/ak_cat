module MarriageProfiles
  class ProfilesController < ApplicationController
    # No need to skip authentication as it's not required globally anymore
    # skip_before_action :authenticate_user!, only: [:index, :show, :select_type]
    before_action :set_profile, only: [:show, :edit, :update, :destroy, :sharing]
    before_action :validate_passcode, only: [:show], if: :shared_profile?
    
    # Include ProfilesHelper to access the trackable_share_url helper method
    include MarriageProfiles::ProfilesHelper

    def index
      @profiles = Profile.all
      if params[:search].present?
        @profiles = @profiles.where("first_name ILIKE :search OR last_name ILIKE :search OR location ILIKE :search OR occupation ILIKE :search", 
                                  search: "%#{params[:search]}%")
      end
      
      if params[:type].present?
        @profiles = @profiles.where(profile_type: params[:type])
      end
    end

    def show
    end

    def select_type
      @profile = Profile.new
    end

    def new
      @profile = Profile.new(profile_type: params[:type] || 'marriage')
      @profile.photos.build
    end

    def create
      @profile = current_user.profiles.build(profile_params)
      if @profile.save
        redirect_to @profile, notice: 'Profile was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      authorize_profile_owner
    end

    def update
      authorize_profile_owner
      if @profile.update(profile_params)
        redirect_to @profile, notice: 'Profile was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize_profile_owner
      @profile.destroy
      redirect_to profiles_url, notice: 'Profile was successfully deleted.'
    end

    def sharing
      authorize_profile_owner
      @link = ShareLinkTracker::Link.find_by(original_url: profile_url(@profile))
      @recent_visits = @link&.recent_visits&.limit(15) || []
      
      # For QR code generation - using helper method now available
      @full_share_url = "#{request.base_url}#{trackable_share_url(@profile)}"
      @qr_code_url = "https://chart.googleapis.com/chart?cht=qr&chs=200x200&chl=#{CGI.escape(@full_share_url)}"
    end

    private

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(
        # Common fields
        :profile_type, :first_name, :last_name, :bio, :location,
        
        # Photos
        :photo, :photo2, :photo3, :cover_image,
        
        # Marriage profile fields
        :date_of_birth, :gender, :religion, :caste, :occupation, 
        :education, :income, :height, :marital_status, 
        :family_details, :preferences, :verified_status,
        
        # Professional profile fields
        :title, :company, :skills, :experience, :portfolio_links,
        :resume, :contact_email, :availability,
        
        # Generic profile fields
        :hobbies, :social_links, :availability_status,
        :name, :passcode, :passcode_enabled,
        photos_attributes: [:id, :image, :_destroy]
      )
    end

    def authorize_profile_owner
      unless @profile.user == current_user
        redirect_to @profile, alert: 'You are not authorized to perform this action.'
      end
    end

    def shared_profile?
      @profile.passcode_enabled? && !current_user
    end

    def validate_passcode
      return true if params[:from_share_link].present?
      
      unless @profile.valid_passcode?(params[:passcode])
        render 'passcode_form', layout: 'marriage_profiles/application'
        return false
      end
      true
    end
  end
end 