Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

  # root "posts#index"
  root to: "home#index"

  # Routes for login and sessions cookies for user
  resources :sessions

  delete "logout" => "sessions#logout", as: :logout


  # Routes for creation, modification and deletion of users
  resources :users

  #Routes for crud page
  resources :crud do
    collection do
      get 'search_from_index'
      post 'create_from_index'
      delete 'delete_from_index'
      put 'update_from_index'
    end
  end

  #Routes for contact
  resources :contacts, only: [:new, :create]


end
