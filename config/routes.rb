Frakedup::Application.routes.draw do

  resources :sign_in_tokens, only: [:create, :destroy]
  resources :sessions, only: [:create]
  resources :users, only: [:new, :create, :update, :destroy, :show, :edit]

  root 'static_pages#home'

  match '/contents', to: 'static_pages#contents',            via: 'get'
  match '/administration', to: 'static_pages#administration', via: 'get'
  match '/welcome', to: 'static_pages#welcome', via: 'get'
  match '/logout', to: 'sessions#destroy',                   via: 'delete'

  put '/users/:id/game/:game_id' => 'users#join', :as => 'join_game'
  post '/games/:id/start' => 'games#start', :as => 'start_game'
  post '/action/:id/execute' => 'actions#execute', :as => 'execute_action'


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

