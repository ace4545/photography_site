Rails.application.routes.draw do
  root 'users#index'
  #resources :homes
  resources :users, only: [:new, :create]

  # Create a better looking URL for logging in
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
end
