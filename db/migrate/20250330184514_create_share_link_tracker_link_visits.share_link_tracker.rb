# This migration comes from share_link_tracker (originally 20250330184022)
class CreateShareLinkTrackerLinkVisits < ActiveRecord::Migration[8.0]
  def change
    create_table :share_link_tracker_link_visits do |t|
      t.references :link, null: false, foreign_key: true
      t.string :device_type
      t.string :ip_address
      t.string :location
      t.datetime :visited_at

      t.timestamps
    end
  end
end
