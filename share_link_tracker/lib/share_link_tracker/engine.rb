module ShareLinkTracker
  class Engine < ::Rails::Engine
    isolate_namespace ShareLinkTracker
    
    # Configure Propshaft asset paths
    initializer "share_link_tracker.assets" do |app|
      app.config.assets.paths << root.join("app/assets/javascripts")
      app.config.assets.paths << root.join("app/assets/stylesheets")
      app.config.assets.paths << root.join("app/assets/images")
    end
  end
end
