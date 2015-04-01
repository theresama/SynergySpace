Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :update]
  resources :spaces do
    resources :leases
  end
  
  root to: 'pages#home'

#put 'users/:id' => 'users#update', :as => :id

  devise_for :users, :path => '', 
    :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up =>'signup'},
    :controllers => { :registrations => 'users' }

  get 'leases' => 'leases#index'

  get 'listings' => 'pages#listings'
  get 'listings/search' => 'pages#listings'
  post 'listings/search' => 'pages#listings'

  get 'dashboard' => 'admin#dashboard'
  get 'dashboard/users' => 'admin#indexUsers'
  get 'dashboard/spaces' => 'admin#indexSpaces'

  get 'submission' => 'pages#submission'
  get 'spaces/new' => 'spaces#new'

  #get 'users/:id' => 'users#show'

  post '/rate' => 'rater#create', :as => 'rate'

  


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
