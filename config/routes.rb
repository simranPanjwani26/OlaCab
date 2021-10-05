Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: "home#index"
  root 'users#index'
  resources :addresses
  root 'address#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
