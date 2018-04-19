Rails.application.routes.draw do

  get '/users/index' => 'users#index'
  root 'users#index'

  post 'users/create' => 'users#createuser'
  get 'users/edit/:id' => 'users#edit'
  post 'users/edit/:id' => 'users#editpro'
  post 'users/login' => 'users#login_pro'

  get 'users/find/:userid' => 'users#usershow'

  get 'logout' => 'users#logout'
  post 'event/create' => 'event#create'
  get 'event/find/:id' => 'event#show'
  get 'event/join/:id' => 'event#join'
  get 'event/unjoin/:id' => 'event#unjoin'
  get 'event/delete/:id' => 'event#delete'
  post 'event/newcomment' => 'event#newcomment'
  get 'event/edit/:id' => 'event#eventedit'
  post 'event/update/:id' => 'event#update'
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
