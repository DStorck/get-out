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

  get 'user/:id' => 'user#profile' , as: :profile
  get 'user/:id/edit' => 'user#edit_profile', as: :edit_profile
  patch 'user/:id' => "user#update_profile", as: :update_profile


  get "user/:id/favorites" => "user#show_faves" , as: :favorite
  post 'user/:id/favorites' => 'user#favorite'
  delete "user/:id/favorites" => "user#delete_fave"

  get "user/:id/favorite-events" => "user#search_favorites", as: :search_favorites

  patch "user/:id/events" => "user#add_event", as: :add_event
  delete "user/:id/events" => "user#delete_event" , as: :delete_event
  get "user/:id/events" => "user#user_events", as: :user_events
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
