# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :order_items
  resources :items
  resources :categories
  resource  :cart, only: %i[show update destroy]
  resources :orders
  resources :user_orders, only: %i[index update show]
  resources :admin, only: %i[index update]
  root 'items#index'

  get ':not_active_storage',
      to: 'application#route_not_found',
      constraints: { not_active_storage: %r{(?!rails/active_storage/blobs).*} }
end
