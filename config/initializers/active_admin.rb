ActiveAdmin.setup do |config|
  # == Site Title
  config.site_title = "Ak Catalyst Admin"

  # == Default Namespace
  config.default_namespace = :admin

  # == User Authentication
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path
  config.logout_link_method = :delete

  # == Authorization Adapter
  # Use a simple CanCan adapter for authorization
  config.authorization_adapter = ActiveAdmin::CanCanAdapter
  config.cancan_ability_class = "AdminAbility"
  config.on_unauthorized_access = :access_denied

  # == Root
  config.root_to = 'dashboard#index'

  # == Comments
  config.comments = false
  
  # == Batch Actions
  config.batch_actions = true

  # == CSV options
  config.csv_options = { col_sep: ',', force_quotes: true }

  # == Filter parameters
  config.filter_attributes = [:encrypted_password, :password, :password_confirmation]

  # == Menu
  config.namespace :admin do |admin|
    admin.build_menu do |menu|
      menu.add label: "Dashboard", priority: 1
      menu.add label: "Hindu Gods", priority: 2
    end
  end

  # == Asset Pipeline
  # For Rails 8 with Propshaft
  config.use_webpacker = false
  
  # For Propshaft, these need to be disabled
  config.clear_stylesheets!
  config.register_stylesheet 'active_admin.css'
  
  config.clear_javascripts!
  config.register_javascript 'active_admin.js'
end 