Rails.application.routes.draw do
  root to: 'home#index'

  get 'login', to: 'user_session#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create destroy]
end
