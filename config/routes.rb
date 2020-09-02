Rails.application.routes.draw do

  root 'items#index'
  # Below : Devise
  devise_for :users
  resources 'items'
  resources 'users', only: [:show, :edit, :update] do
    resources :avatars, only: [:create]
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #Below : Stripe
  resources :charges
end
