Rails.application.routes.draw do

  namespace :admin do
      resources :users
      resources :carts
      resources :cart_items
      resources :items
      resources :orders
      resources :order_items

      root to: "users#index"
    end
  root 'items#index'
  devise_for :users
  resources 'items'
  resources 'users', only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :charges
end
