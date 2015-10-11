Rails.application.routes.draw do
  resources :control_list_months do

    member do
      get 'pdf'
    end
  end
  resources :control_list_factor_groups
  resources :control_list_factors do

    member do
      patch 'enable'
    end
  end
  resources :turn_schemes
  resources :turn_types
  resources :issue_types do
    member do
      patch 'enable'
    end
  end
  resources :critical_types

  root 'work#by_day_in_month'

  get 'work_spaces/get_issue_types'
  # get 'issues/next_date'
  # get 'issues/days_in_month'
  get 'work/app_login'
  get 'work/app_logout'
  get 'work/user_info'
  get 'work/by_day_in_month'
  resources :issues do
    collection do
      get 'monthly'
      get 'next_date'
      get 'days_in_month'
      get 'monthly_by_day'
      get 'assigned'
      get 'owned'
    end
  end

  devise_for :users
  devise_for :subdivisions
  devise_for :managements
  devise_for :areas
  devise_for :work_spaces
  devise_for :issue_types
  devise_for :auto_work_spaces


  devise_scope :users do
    get "sign_out", :to => "devise/sessions#destroy"
  end
  resources :users
  resources :subdivisions
  resources :managements
  resources :areas
  resources :work_spaces do
    member do
      patch 'enable'
    end
  end

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
