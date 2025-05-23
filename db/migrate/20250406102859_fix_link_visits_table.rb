class FixLinkVisitsTable < ActiveRecord::Migration[8.0]
  def change
    # Drop the existing table if it exists
    drop_table :share_link_tracker_link_visits if table_exists?(:share_link_tracker_link_visits)
    
    # Recreate the table with the correct foreign key
    create_table :share_link_tracker_link_visits do |t|
      t.references :link, null: false, foreign_key: { to_table: :share_link_tracker_links }
      t.string :device_type
      t.string :ip_address
      t.string :location
      t.datetime :visited_at

      t.timestamps
    end
  end
end
