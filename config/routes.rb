Rails.application.routes.draw do
  get 'static_pages/about'

  get 'recipients/index'
  get 'recipients/show'
  get 'recipients/new'
  get 'recipients/edit'
  get 'recipients/create'
  get 'recipients/update'
  get 'recipients/destroy'

  # resources :static_pages
  get 'about' => "static_pages#about"
  # get '/static_pages/about' => 'static_pages#about'
  #routes for session
  get "login"     => 'sessions#new'
  post "login"    => 'sessions#create'
  delete "logout" => 'sessions#destroy'

  #route for oauth
  get '/auth/:provider/callback', to: 'sessions#create', as: :omniauth
  delete '/logout', to: 'sessions#destroy'

  post 'i_am_ok' => 'ousers#imalive'

  resources :posts

  resources :ousers

  require 'sidekiq/web'
  mount Sidekiq::Web => '/deadppl'

  root 'sessions#new'


end
