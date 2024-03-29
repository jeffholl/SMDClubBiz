Clubbiz::Application.routes.draw do
 
  get "admins/dashboard"
  get "admins/pending_club/:id" => "admins#pending_club", as: "admins_pending_club"

  get 'club_admins/eventdisplay' => "club_admins#eventdisplay", as: "clubadmin_eventdisplay"
  get "club_admins/dashboard/:id" => "club_admins#dashboard", as: "dashboard"
  get "club_admins/events/:id" => "club_admins#events", as: "clubadmin_events"
  get "club_admins/settings/:id" => "club_admins#settings", as: "clubadmin_settings"
  
  get "permission_denied" => "pages#permission_denied", as: "permission_denied"
  get "about" => "pages#help", as: "help"
  get "terms" => "pages#terms", as: "terms"
  get "privacy" => "pages#privacy", as: "privacy"
  get "about" => "pages#about", as: "about"
  get "search" => "pages#search", as: "search"

  resources :shared_events, only: [:edit, :create, :update, :destroy]

  resources :event_comments, only: [:edit, :create, :update, :destroy]
  get "event_comments/new/:id" => "event_comments#new", as: "new_event_comment"

  resources :club_comments, only: [:edit, :create, :update, :destroy]
  get "club_comments/new/:id" => "club_comments#new", as: "new_club_comment"

  resources :memberships, only: [:index, :edit, :create, :update, :destroy]
  get "memberships/new/:id" => "memberships#new", as: "new_membership"
  
  resources :tickets

  resources :ticket_allocations, except: [:new]
  get "ticket_allocations/new/:id" => "ticket_allocations#new", as: "new_ticket_allocation"

  resources :events, except: [:new]
  get "events/new/:id" => "events#new", as: "new_event"

  devise_for :users
  get "users/:id" => 'users#show', as: 'user'
  resources :clubs

  #root route to direct inbound traffic on clean domain named
  root to: "pages#home"
  
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
