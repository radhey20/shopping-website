Qlineapp::Application.routes.draw do
    resources :contacts
    
    resources :orders
    
    resources :line_items
    
    resources :carts
    resources :categories
    
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    
    
    #Our index page
    root :to => "users#index"
    
    
    
    get "log_out" => "sessions#destroy", :as => "log_out"
    get "log_in" => "sessions#new", :as => "log_in"
    get "sign_up" => "users#new", :as => "sign_up"
    
    get "home" => "users#index", :as => "home"
    get "lookbook" => "users#Lookbook", :as => "lookbook"
    get "aboutus" => "users#AboutUs", :as => "aboutus"
    get "sourses" => "users#Sourses", :as => "sourses"
    get "history" => "users#History", :as => "history"
    get "men" => "users#Men", :as => "men"
    get "women" => "users#Women", :as => "women"
    get "user_create" => "users#CreateFromOrder", :as => "user_create"
    get "contactus" => "contacts#new", :as => "contactus"
    get "show" => "categories#show", :as => "show"
    get "carts" => "carts#show", :as => "carts"
    
    resources :users
    resources :sessions
    resources :admin
    resources :products
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
    # root :to => 'welcome#index'
    
    # See how all your routes lay out with "rake routes"
    
    # This is a legacy wild controller route that's not recommended for RESTful applications.
    # Note: This route will make all actions in every controller accessible via GET requests.
    # match ':controller(/:action(/:id))(.:format)'
end

