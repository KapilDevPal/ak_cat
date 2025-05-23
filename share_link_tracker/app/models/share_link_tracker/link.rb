module ShareLinkTracker
    class Link < ApplicationRecord
        self.table_name = 'share_link_tracker_links'
        belongs_to :user, optional: true
        has_many :link_visits, class_name: "ShareLinkTracker::LinkVisit", dependent: :destroy
        before_create :generate_short_url
        validates :original_url, presence: true, format: { with: URI::regexp }

        def generate_short_url
            self.short_url = SecureRandom.hex(6)
        end

        def device_type_stats
            link_visits.group(:device_type).count
        end

        def location_stats
            link_visits.group(:location).count
        end

        def recent_visits(limit = 10)
            link_visits.order(created_at: :desc).limit(limit)
        end
    end
end
  