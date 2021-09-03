Rails.application.routes.draw do
  devise_for :users
 #{} get 'sign_up', to: 'registrations#new'
 get 'user/about'
  get 'user/index'
  root 'user#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
