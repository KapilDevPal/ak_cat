module ShareLinkTracker
  class LinkVisit < ApplicationRecord
    self.table_name = 'share_link_tracker_link_visits'

    belongs_to :link, class_name: "ShareLinkTracker::Link"
  end
end
