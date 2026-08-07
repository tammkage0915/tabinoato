Rails.application.routes.draw do
  get "users/new"
  
  root to: 'homes#top'

  resources :users, only: [:create, :show]
  get 'users/sign_up', to: 'users#new', as: :new_user
  get   'mypage',                     to: 'users#show',        as: :mypage
  get   'users/information/edit',    to: 'users#edit',        as: :edit_user_information
  patch 'users/information',         to: 'users#update',      as: :update_user_information
  get   'users/information/unsubscribe', to: 'users#unsubscribe', as: :unsubscribe_user_information
  patch 'users/information/withdraw',    to: 'users#withdraw',    as: :withdraw_user_information

  get    'users/sign_in', to: 'sessions#new',     as: :new_session
  post   'users/sign_in', to: 'sessions#create',  as: :session
  delete 'users/sign_out', to: 'sessions#destroy', as: :destroy_session

  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
