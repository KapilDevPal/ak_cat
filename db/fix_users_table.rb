# Check if admin column exists in users table
columns = ActiveRecord::Base.connection.columns("users").map(&:name)
if columns.include?("admin")
  puts "Admin column already exists in users table - no changes needed"
else
  # Add admin column if it doesn't exist
  ActiveRecord::Base.connection.execute("ALTER TABLE users ADD COLUMN admin boolean DEFAULT false;")
  puts "Added admin column to users table"
end 