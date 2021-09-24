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
    resources :usages
  end
  root 'users#home'
end
