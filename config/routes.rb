Rails.application.routes.draw do
  resources :users
  devise_for :users
  resources :plans do
    resources :features
  end

  get 'user/about'
  get 'user/add_buyer', to: 'user#add_buyer'
  get 'user/add_plan', to: 'user#add_plan'
  get 'user/add_feature', to: 'user#add_features'
  root 'user#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
