Rails.application.routes.draw do
  devise_for :users
  resources :order_items
  resources :items
  resources :categories
  resource  :cart, only: %i[show update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
end
