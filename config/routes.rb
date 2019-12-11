Rails.application.routes.draw do
  resources :users
  get 'users/show'
  devise_for :admins
  root to: 'dashboard#index'
  resources :detail_models
  resources :posts
  resources :models
  resources :sizes, only: [:create, :destroy] 
  resources :colors, only: [:create, :destroy] 
  devise_for :users
  #api
  post "user/login", to: "api/authentication#login"
  get "/auth/check", to: "api/authentication#check"
  get "/list", to: "api/models#index"
  get "/info", to: "api/models#info"
  get "/size_color", to: "api/models#size_color"
  post "/order", to: "api/orders#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
