Rails.application.routes.draw do
  resources :vehicles
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :users
  root 'users#index'
  resources :addresses
  resources :bookings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
