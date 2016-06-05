Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  root 'search#index'
  post 'search' => 'search#display_events', as: :display_events
  get '/auth/:provider/callback' => 'sessions#create'
  delete "/logout" => "sessions#destroy"

  get 'users/:id' => 'users#profile' , as: :profile
  get 'users/:id/edit' => 'users#edit_profile', as: :edit_profile
  patch 'users/:id' => "users#update_profile", as: :update_profile

  get "users/:id/favorites" => "users#show_faves" , as: :favorite
  post 'users/:id/favorites' => 'users#favorite'
  delete "users/:id/favorites" => "users#delete_fave"

  get "users/:id/favorite-events" => "users#search_favorites", as: :search_favorites

  patch "users/:id/events" => "users#add_event", as: :add_event
  delete "users/:id/events" => "users#delete_event" , as: :delete_event
  get "users/:id/events" => "users#user_events", as: :user_events
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
