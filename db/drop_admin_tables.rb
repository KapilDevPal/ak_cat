ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS active_admin_comments;")
ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS admin_users;")

puts "Dropped admin-related tables" 