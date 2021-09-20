# frozen_string_literal: true

Rails.application.routes.draw do
 devise_for :users, controllers: { registration: 'users/registration#create' }
  resources :users do
    collection do
      get 'charge_account'
    end
    resources :plans do
      resources :features
      resources :subscriptions
      resources :checkouts
    end
    resources :plan_usages
    post 'checkouts/create', to: 'checkouts#create', as: 'checkouts'
  end
  root 'users#home'
end
