Rails.application.routes.draw do
  root to: 'dashboard#index'
  resources :detail_models
  resources :posts
  resources :models
  resources :sizes, only: [:create, :destroy] 
  resources :colors, only: [:create, :destroy] 
  devise_for :users
  post "user/login", to: "api/authentication#login"
  get "/auth/check", to: "api/authentication#check"
  get "/list", to: "api/models#index"
  get "/info", to: "api/models#info"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
