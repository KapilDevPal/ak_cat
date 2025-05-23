class AddAdminToUsers < ActiveRecord::Migration[8.0]
  def up
    # Check if admin column already exists
    return if column_exists?(:users, :admin)
    
    add_column :users, :admin, :boolean, default: false
  end

  def down
    remove_column :users, :admin if column_exists?(:users, :admin)
  end
end
