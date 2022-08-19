Rails.application.routes.draw do
  root to: 'home#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create destroy]
  resources :spots do
    resources :feedbacks, only: %i[index create destroy], shallow: true 
    collection do
      get :likes
    end
  end
  resources :likes, only: %i[create destroy]
end
