class AddReferrerToShareLinkTrackerLinkVisits < ActiveRecord::Migration[8.0]
  def change
    add_column :share_link_tracker_link_visits, :referrer, :string
  end
end
