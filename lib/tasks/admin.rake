namespace :admin do
  desc "Create default admin user"
  task create: :environment do
    AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin|
      admin.password = 'password123'
      admin.password_confirmation = 'password123'
      puts "Admin user created: admin@example.com / password123"
    end
  end
end 