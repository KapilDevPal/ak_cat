module MarriageProfiles
  class HomeController < ApplicationController
    # No need to skip authentication as it's not required globally anymore
    # skip_before_action :authenticate_user!, only: [:index]

    def index
      @profiles = Profile.limit(6).order(created_at: :desc)
    end
  end
end 