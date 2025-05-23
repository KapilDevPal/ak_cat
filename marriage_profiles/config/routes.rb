MarriageProfiles::Engine.routes.draw do
  root to: 'home#index'
  
  resources :profiles do
    collection do
      get :search
      get :select_type
    end
    
    member do
      get :sharing
    end
  end
  
  # Add route for shared profiles
  get 'shared/:id', to: 'shared_profiles#show', as: :shared_profile
end
