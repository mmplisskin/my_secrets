Rails.application.routes.draw do
  get 'recipients/index'
  get 'recipients/show'
  get 'recipients/new'
  get 'recipients/edit'
  get 'recipients/create'
  get 'recipients/update'
  get 'recipients/destroy'

  #routes for user
  # get "users" => "users#index"
  # get "users/new" => "users#new"
  # post "users" => "users#create"

  #routes for session
  get "login"     => 'sessions#new'
  post "login"    => 'sessions#create'
  delete "logout" => 'sessions#destroy'

  #route for oauth
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post 'i_am_ok'=> 'ousers#imalive'

  resources :posts
  # get "secrets" => "posts#index"
  # get "secrets/new" => "secrets#new"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#new'


  # get "posts/ok" => "posts#ok", as: :ok
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

end
