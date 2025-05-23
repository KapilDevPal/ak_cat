module ShareLinkTracker
  class Engine < ::Rails::Engine
    isolate_namespace ShareLinkTracker

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
    end
  end
end

ShareLinkTracker::Engine.routes.draw do
  root 'links#index'
  
  # Direct access to short URLs
  get '/:short_url', to: 'links#show', as: :short_link, constraints: { short_url: /[a-f0-9]{12}/ }
  
  resources :links, only: [:index, :new, :create] do
    member do
      get :infographic
    end
  end
end
