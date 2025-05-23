class FixLinkVisitsForeignKey < ActiveRecord::Migration[8.0]
  def change
    # Remove the incorrect foreign key
    remove_foreign_key :share_link_tracker_link_visits, :links
    
    # Add the correct foreign key
    add_foreign_key :share_link_tracker_link_visits, :share_link_tracker_links, column: :link_id
  end
end
