Rails.application.routes.draw do

  # Routes for the User_credit_card resource:
  # CREATE
  get "/user_credit_cards/new", :controller => "user_credit_cards", :action => "new"
  post "/calculator", :controller => "user_credit_cards", :action => "calculator"
  post "/create_new_transaction", :controller => "user_credit_cards", :action => "create"

  # READ
  get "/user_credit_cards", :controller => "user_credit_cards", :action => "index"
  get "/user_credit_cards/:id", :controller => "user_credit_cards", :action => "show"

  # UPDATE
  get "/user_credit_cards/:id/edit", :controller => "user_credit_cards", :action => "edit"
  post "/update_user_credit_card/:id", :controller => "user_credit_cards", :action => "update"

  # DELETE
  get "/delete_user_credit_card/:id", :controller => "user_credit_cards", :action => "destroy"
  #------------------------------

# This is the default Home Page
  devise_scope :user do
    root to: "devise/sessions#new"
  end

# Home Page
  # get "/user_home", :controller => "user_home", :action => "index"

  get "/user_home_calculator", :controller => "user_home", :action => "calculator"

  get "/blog_news", :controller => "blog_news", :action => "show"

  get "/contact_us", :controller => "contact_us", :action => "show"

  # Routes for the Reward_calculator resource:
  # CREATE
  get "/reward_calculators/new", :controller => "reward_calculators", :action => "new"
  post "/create_reward_calculator", :controller => "reward_calculators", :action => "create"

  # READ
  get "/reward_calculators", :controller => "reward_calculators", :action => "index"
  get "/reward_calculators/:id", :controller => "reward_calculators", :action => "show"

  # UPDATE
  get "/reward_calculators/:id/edit", :controller => "reward_calculators", :action => "edit"
  post "/update_reward_calculator/:id", :controller => "reward_calculators", :action => "update"

  # DELETE
  get "/delete_reward_calculator/:id", :controller => "reward_calculators", :action => "destroy"
  #------------------------------

  # Routes for the Credit_card resource:
  # CREATE
  get "/credit_cards/new", :controller => "credit_cards", :action => "new"
  post "/create_credit_card", :controller => "credit_cards", :action => "create"

  # READ
  get "/credit_cards", :controller => "credit_cards", :action => "index"
  get "/credit_cards/:id", :controller => "credit_cards", :action => "show"

  # UPDATE
  get "/credit_cards/:id/edit", :controller => "credit_cards", :action => "edit"
  post "/update_credit_card/:id", :controller => "credit_cards", :action => "update"

  # DELETE
  get "/delete_credit_card/:id", :controller => "credit_cards", :action => "destroy"
  #------------------------------

  # Routes for the Reward resource:
  # CREATE
  get "/rewards/new", :controller => "rewards", :action => "new"
  post "/create_reward", :controller => "rewards", :action => "create"

  # READ
  get "/rewards", :controller => "rewards", :action => "index"
  get "/rewards/:id", :controller => "rewards", :action => "show"

  # UPDATE
  get "/rewards/:id/edit", :controller => "rewards", :action => "edit"
  post "/update_reward/:id", :controller => "rewards", :action => "update"

  # DELETE
  get "/delete_reward/:id", :controller => "rewards", :action => "destroy"
  #------------------------------

  devise_for :users


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
