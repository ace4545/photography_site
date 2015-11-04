Rails.application.routes.draw do
  get 'static_pages/contact'

  get 'static_pages/portraits'

  get 'static_pages/who_I_am'

  get 'static_pages/blog'

  root 'homes#index'
  resources :homes
  resources :users, only: [:new, :create]
  resources :static_page, only: [:contact, :blog]
  # Create a better looking URL for logging in
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
end
