Rails.application.routes.draw do
  devise_for :users

  get 'user/about'
  get 'user/add_buyer', to: 'user#add_buyer'
  get 'user/add_plan', to: 'user#add_plan'
  get 'user/add_feature', to: 'user#add_features'

  get '/features/addfeature', to: 'features#add_features'
  post 'features/addfeature', to: 'features#add_features'
  resources :features
  resources :user
  root 'user#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
