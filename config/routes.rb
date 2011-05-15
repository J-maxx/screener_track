ScreenerTrack::Application.routes.draw do
  
  resources :users
  resources :sessions
  resources :projects
  resources :assets
  resources :requests
  
  match "requests/new" => "requests#new", :as => :new_request
  delete 'requests/:id' => 'requests#destroy',  :as => :delete_request
  
  get   "logout"   => "sessions#destroy",  :as => "logout"
  get   "login"    => "sessions#new",      :as => "login"
  
  get   "signup"   => "users#new",         :as => "signup"
  get   "users/:id/edit" => "users#edit", :as => :edit_user

  
  match 'projects/index' => 'projects#index',   :as => :projects_list
  match 'projects/:id/edit' => 'projects#edit', :as => :edit_project
  match 'projects/new'    => 'projects#new', :as => :new_project

  match 'assets'          => 'assets#index',  :as => :assets_list
  match 'assets/:id/edit' => 'assets#edit',   :as => :edit_asset
  match 'assets/new'      => 'assets#new',    :as => :new_asset
  post  'assets/create'   => 'assets#create'

  match 'about'            => 'pages#about'
  match 'faq'              => 'pages#faq'
  match 'policies'         => 'pages#policies'
  match 'contact'          => 'pages#contact'
  match 'roles(:role)'     => 'pages#roles', :as => 'roles'
  match 'send_contact'     => 'pages#send_contact'
  
  
#  post 'requests/process_request(:id, :sub_task)' => 'requests#process_request', :as => :process_request
  post 'requests/approve' => 'requests#approve'
  post 'requests/reject' => 'requests#reject'
  post 'requests/fulfill' => 'requests#fulfill'
  root :to => "pages#home" 
  
  
  
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
