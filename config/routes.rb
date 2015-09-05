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
  get "otp/:id" => 'sessions#otp', as: :otp
  post "otp/:id"    => 'sessions#otpcreate'
  delete "logout" => 'sessions#destroy'

  #route for oauth
  get '/auth/:provider/callback', to: 'sessions#create', as: :omniauth
  delete '/logout', to: 'sessions#destroy'

  post 'i_am_ok' => 'ousers#imalive'

  resources :posts

  resources :ousers

  resources :charges



  root 'sessions#new'


  require "sidekiq/web"
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV["SIDEKIQ_USERNAME"] && password == ENV["SIDEKIQ_PASSWORD"]
  end if Rails.env.production?
  mount Sidekiq::Web, at: "/sidekiq"





end
