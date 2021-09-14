Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :plans do
      resources :features
      resources :subscriptions
      resources :payments
    end
  end
  root 'users#index'
end
