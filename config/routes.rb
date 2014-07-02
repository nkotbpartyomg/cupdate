
Rails.application.routes.draw do

  get 'sign_in' => "sessions#new", as: :sign_in

  post 'sessions/create'

  get 'sessions/destroy'

  get 'sessions/create_at_sign_up/artist/:artist_id', to: 'sessions#create_at_sign_up', as: :create_session_at_sign_up

  get "send_test_email/artist/:artist_id", to: 'artists#send_test_email', as: :send_test_email

  resources :artists do 
    resources :items do
    patch "update_and_send_email", as: :update_and_send_email
   # get "new_item", to: "artists#new_item", as: "new_item"
    end
  end

 # get 'items' => "items#show", as: :items

  root "home#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
