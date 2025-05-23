# This migration comes from share_link_tracker (originally 20250329154729)
class CreateShareLinkTrackerLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :share_link_tracker_links do |t|
      t.string :original_url
      t.string :short_url, null: false
      t.integer :clicks_count, default: 0
      t.timestamps
    end
    # add_index :share_link_tracker_links, :original_url, unique: true
    add_index :share_link_tracker_links, :short_url, unique: true
  end
end
