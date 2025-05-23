Rails.application.routes.draw do
  # Custom admin authentication routes
  devise_scope :admin_user do
    get '/admin/login' => 'admin/sessions#new', as: :new_admin_user_session
    post '/admin/login' => 'admin/sessions#create', as: :admin_user_session
    delete '/admin/logout' => 'admin/sessions#destroy', as: :destroy_admin_user_session
    get '/admin/logout' => 'admin/sessions#destroy'
  end

  # ActiveAdmin routes
  devise_for :admin_users, ActiveAdmin::Devise.config.merge({
    skip: [:sessions]
  })
  ActiveAdmin.routes(self)

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Shared authentication routes for regular users
  devise_scope :user do
    get '/users/sign_in' => 'sessions#new', as: :user_sign_in
    post '/users/sign_in' => 'sessions#create'
    delete '/users/sign_out' => 'sessions#destroy', as: :user_sign_out
    get '/users/sign_up' => 'users#new', as: :user_sign_up
    post '/users/sign_up' => 'users#create'
  end

  # User resources
  resources :users, only: [:new, :create]

  # API routes for Bx_block_god
  namespace :api do
    namespace :v1 do
      namespace :bx_block_god do
        resources :gods
        resources :bhajans, only: [:index]
      end
    end
  end

  # Hindu Gods React App routes
  namespace :bx_block_god do
    get 'gods', to: 'gods#index'
    get 'gods/*path', to: 'gods#index'
  end

  # Add route for /hindu_gods
  get 'hindu_gods', to: 'bx_block_god/gods#index'
  get 'hindu_gods/*path', to: 'bx_block_god/gods#index'

  # Plugin routes
  mount ShareLinkTracker::Engine, at: "/share_link_tracker"
  mount MarriageProfiles::Engine, at: "/marriage_profiles"

  # Defines the root path route ("/")
  root 'home#index'
  post "contact", to: "home#create_contact", as: :create_contact
end
