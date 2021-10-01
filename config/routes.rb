Rails.application.routes.draw do
  devise_for :users
  resources :order_items
  resources :items
  resources :categories
  resource  :cart, only: %i[show update destroy]
  resources :orders
  resources :user_orders, only: %i[index update show]
  resources :admin, only: %i[index update]
  resource :search, only: :show
  match '*unmatched', to: 'application#route_not_found', via: :all
  root 'items#index'
end
