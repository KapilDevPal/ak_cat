# share_link_tracker/app/controllers/share_link_tracker/links_controller.rb
module ShareLinkTracker
  class LinksController < ApplicationController
    # No need to skip authentication as it's not required globally anymore
    # skip_before_action :authenticate_user!, only: [:show, :index]
    before_action :set_link, only: [:show, :edit, :update, :destroy, :infographic]

    def index
      @links = ShareLinkTracker::Link.where(user_id: current_user.id)
                                    .order(created_at: :desc)
    end

    def new
      @link = ShareLinkTracker::Link.new
    end

    def create
      @link = ShareLinkTracker::Link.new(link_params)
      @link.user_id = current_user.id

      if @link.save
        redirect_to share_link_tracker.links_path, notice: 'Link was successfully created.'
      else
        render :new
      end
    end

    def show
      @link = ShareLinkTracker::Link.find_by(short_url: params[:short_url] || params[:id])
      
      if @link
        @link.increment!(:clicks_count)
        ShareLinkTracker::LinkVisit.create!(
          link: @link,
          ip_address: request.remote_ip,
          user_agent: request.user_agent,
          device_type: detect_device_type,
          location: detect_location
        )
        
        # Extract profile ID from the original URL
        if @link.original_url.include?('/marriage_profiles/profiles/')
          profile_id = @link.original_url.split('/').last
          redirect_to marriage_profiles.shared_profile_path(profile_id), allow_other_host: true
        else
          redirect_to @link.original_url, allow_other_host: true
        end
      else
        flash[:alert] = "Link not found"
        redirect_to main_app.root_path
      end
    end

    def edit
    end

    def update
      if @link.update(link_params)
        redirect_to share_link_tracker.links_path, notice: 'Link was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @link.destroy
      redirect_to share_link_tracker.links_path, notice: 'Link was successfully destroyed.'
    end

    def infographic
      @visits_by_date = @link.link_visits
                            .group("DATE(created_at)")
                            .count

      @unique_visitors_by_date = @link.link_visits
                                     .group("DATE(created_at)")
                                     .distinct
                                     .count(:ip_address)

      @chart_data = {
        dates: @visits_by_date.keys,
        visit_counts: @visits_by_date.values,
        unique_visitors: @unique_visitors_by_date.values,
        device_data: @link.device_type_stats,
        location_data: @link.location_stats,
        time_data: @link.link_visits
                       .group("strftime('%H', created_at)")
                       .count
      }

      @cumulative_visits = []
      total = 0
      @visits_by_date.values.each do |count|
        total += count
        @cumulative_visits << total
      end
    end

    private

    def set_link
      @link = ShareLinkTracker::Link.find_by(id: params[:id]) if params[:id].present?
    end

    def link_params
      params.require(:link).permit(:original_url, :title, :description)
    end

    def detect_device_type
      user_agent = request.user_agent.to_s.downcase
      if user_agent.include?('mobile')
        'Mobile'
      elsif user_agent.include?('tablet')
        'Tablet'
      else
        'Desktop'
      end
    end

    def detect_location
      # This is a placeholder. In a real application, you would use a geolocation service
      # like MaxMind GeoIP or similar to determine the actual location
      'Unknown'
    end
  end
end
  