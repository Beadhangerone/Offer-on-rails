Rails.application.routes.draw do
#-----home
	get "/" => "home#index"
  get "/registration" => "home#registration"
  get "/profile" => "home#profile"
  get "/logout" => "home#logout"
  get "/settings" => "home#settings"
#-----home_end

#-----user
  get "/user/ads" => "user#ads"
  resources :user, only: [:show]
  post "/registration" => "user#create"
  post "/login" => "user#login"
  post "/settings" => "user#edit"
#-----user_end

#-----ad
  resources :ad, except: [:index, :update, :destroy]
  post "/ad/:id/edit" => "ad#update"
  get "/ad/:id/destroy" => "ad#destroy"
  # get "/ad/new" => "ad#new"
  # post "/ad/new" => "ad#create"
  # get "/ad/:id" => "ad#show"
#-----ad_end

#-----category_end
  resources :category, only: [:show] do
    resources :subcategory, only: [:show]
  end
#-----category






  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #get 'products/:id' => 'catalog#view'

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
