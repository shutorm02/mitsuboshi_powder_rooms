Rails.application.routes.draw do
  root to: 'home#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback',  to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider

  resources :users, only: %i[new create destroy]
  resources :spots do
    resources :feedbacks, only: %i[index new create destroy], shallow: true 
    collection do
      get :likes
    end
    resources :spot_images, only: %i[new create edit update destroy]
  end
  resources :likes, only: %i[create destroy]
  resource :profile, only: %i[show edit update]

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :users, only: %i[index edit update show destroy]
    resources :spots, only: %i[index edit update show destroy]
  end
end
