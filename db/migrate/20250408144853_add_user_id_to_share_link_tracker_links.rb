class AddUserIdToShareLinkTrackerLinks < ActiveRecord::Migration[8.0]
  def change
    add_column :share_link_tracker_links, :user_id, :integer
    add_index :share_link_tracker_links, :user_id
    add_foreign_key :share_link_tracker_links, :users
  end
end
