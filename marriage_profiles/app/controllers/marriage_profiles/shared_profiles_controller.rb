module MarriageProfiles
  class SharedProfilesController < ApplicationController
    # No need to skip authentication as it's not required globally anymore
    # skip_before_action :authenticate_user!
    
    def show
      @profile = Profile.find(params[:id])
      
      if @profile.passcode_enabled?
        unless @profile.valid_passcode?(params[:passcode])
          render 'marriage_profiles/profiles/passcode_form', layout: 'marriage_profiles/application'
          return
        end
      end
      
      render 'marriage_profiles/profiles/show', layout: 'marriage_profiles/application'
    end
  end
end 