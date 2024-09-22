Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'dashboard#index'
  resources :devices
  resources :device_requests
  resources :patients
  resources :feeds
  resources :notifications
  resources :hospitals

  mount ActionCable.server => '/cable'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
