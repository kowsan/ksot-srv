Rails.application.routes.draw do
  resources :issue_types
  resources :critical_types
  resources :turn_types
  root 'work#user_info'
  get 'issues/monthly'
  get 'work_spaces/get_issue_types'
  get 'issues/next_date'

  resources :issues
  get 'work/app_login'
  get 'work/app_logout'
  get 'work/user_info'

  devise_for :users
  devise_for :subdivisions
  devise_for :managements
  devise_for :areas
  devise_for :work_spaces
  devise_for :issue_types
  devise_for :auto_work_spaces
  devise_for :turn_types
  devise_scope :users do
    get "sign_out", :to => "devise/sessions#destroy"
  end
  resources :users
  resources :subdivisions
  resources :managements
  resources :areas
  resources :work_spaces
  resources :issue_types
  resources :auto_work_spaces



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
