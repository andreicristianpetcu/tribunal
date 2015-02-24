Rails.application.routes.draw do
  resources :blog_pages

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

  resources :contact_emails

  resources :jurisprudences

  resources :dictionary_terms

  resources :trial_proceedings

  resources :proceedings

  resources :blog_posts

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: "contact_emails#new"
  # root 'contact_emails#new'
  
  resources :trial_files

  resources :trial_meetings

  # get 'meetings/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :courts

  get 'pages/working_on_it' => 'high_voltage/pages#show', id: 'working_on_it'
  get 'pages/despre' => 'high_voltage/pages#show', id: 'despre'
  get 'pages/educatie' => 'high_voltage/pages#show', id: 'educatie'
  get 'pages/indicele-de-performanta' => 'high_voltage/pages#show', id: 'indicele-de-performanta'

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
