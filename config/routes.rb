Tutorial::Application.routes.draw do
  get "sessions/new"

  resources :users do
    collection do
      put 'reset'
      put 'eot'
    end
    member do
      put 'primary'
      put 'suspended'
      put 'make_admin'
      get 'edit_password'
      get 'set_cas'
      put 'update_cas'
    end  
  end
  resources :sessions, :only => [:new, :create, :destroy, :update, :edit]
  resources :shift_types, :except => :show do
    member do
      get 'naughty'
    end
  end
  resources :shifts do
    collection do
      get 'available'
    end
    member do
      put 'primary'
      put 'secondary'
      put 'drop_primary'
      put 'drop_secondary'
    end
  end

  match '/contact',         :to => 'pages#contact'
  match '/about',           :to => 'pages#about'
  match '/help',            :to => 'pages#help'
  match '/signin',	        :to => 'sessions#new'
  match '/signout',         :to => 'sessions#destroy'
  match '/eot',             :to => 'pages#eot'
  match '/forgot_password', :to => 'pages#forgot_password'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "pages#home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
