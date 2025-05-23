ActiveRecord::Base.connection.execute(<<-SQL)
  DELETE FROM schema_migrations 
  WHERE version IN ('20250522111326', '20250522065522', '20250522064035', '20250514071043');
SQL

puts "Removed problematic migrations from schema_migrations table" 