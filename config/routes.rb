# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registration: 'users/registration#create' }
  resources :users do
    collection do
      get 'charge_account'
    end
    resources :plans do
      resources :features, except: [:show]
      resources :subscriptions, only: %i[index create]
      resources :checkouts, only: %i[index create]
    end
    resources :usages
  end

  get '/search', to: 'users#search'
  root 'users#home'
  match '*path', via: :all, to: redirect('/404')
end
