module MarriageProfiles
  class Engine < ::Rails::Engine
    isolate_namespace MarriageProfiles

    initializer "marriage_profiles.assets.precompile" do |app|
      app.config.assets.precompile += %w(marriage_profiles/application.css marriage_profiles/application.js)
    end

    initializer "marriage_profiles.assets" do |app|
      app.config.assets.paths << root.join("app", "assets", "stylesheets")
      app.config.assets.paths << root.join("app", "assets", "javascripts")
      app.config.assets.paths << root.join("app", "assets", "images")
    end

    initializer "marriage_profiles.load_migrations" do |app|
      app.config.paths["db/migrate"].concat(config.paths["db/migrate"].expanded)
    end

    initializer "marriage_profiles.autoload_paths" do |app|
      app.config.autoload_paths += %W(#{config.root}/app/models)
    end

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
    end
  end
end
