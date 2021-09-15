# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :plans do
      resources :features
      resources :subscriptions
      resources :payments
    end
    resources :plan_usages
    post 'checkouts/create', to: 'checkouts#create', as: 'checkouts'
  end


  root 'users#home'
end
