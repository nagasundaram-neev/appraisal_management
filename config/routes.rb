AppraisalManagement::Application.routes.draw do
  get "static_pages/home"
  get "static_pages/help"
  match 'appraisal_cycles/overall_performance' => 'appraisal_cycles#overall_performance', as: :appraisal_cycles_overall_performance, via: [:get, :post]
  match 'kra_sheets/kra_status_update' => 'kra_sheets#kra_status_update', as: :kra_sheets_kra_status_update, via: [:get, :post]
  match 'kra_sheets/kra_manager_status_update' => 'kra_sheets#kra_manager_status_update', as: :kra_sheets_kra_manager_status_update, via: [:get, :post]
  match 'appraisal_cycles/performance_graph' => 'appraisal_cycles#performance_graph', as: :appraisal_cycles_performance_graph, via: [:get, :post]
  match 'appraisal_cycles/total_performance_graph' => 'appraisal_cycles#total_performance_graph', as: :appraisal_cycles_total_performance_graph, via: [:get, :post]
  devise_for :users, :controllers => { registrations: 'users/registrations'}
  resources :kra_attrs
  resources :departments
  resources :roles
  resources :appraisal_cycles do
    collection do
      get 'overall_performance'
      get 'performance_graph'
      post 'total_performance_graph'
    end
  end
  resources :kra_sheets do
    collection do
      get 'kra_status_update'
      get 'kra_manager_status_update'
    end
  end
  resources :kra_ratings
  get 'new_role_user', to: 'roles#new_role'
  post 'add_role', to: 'roles#add_role'
  get 'new_dept', to: 'departments#new_dept'
  post 'add_dept', to: 'departments#add_dept'
  get 'get_appraisees', to: 'home#get_appraisees'
  get 'get_past_appraisees', to: 'home#get_past_appraisees'
  get 'total_performance_graph', to: 'home#total_performance_graph'
  get 'revert_signoff', to: 'kra_ratings#revert_signoff'
  root :to => 'home#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase_urlchase' => 'catalog#purchase', as: :purchase

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
