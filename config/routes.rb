Rails.application.routes.draw do
  # get 'welcome/index'
  
  resources :vehicles
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :users
  #root 'users#index'
  resources :addresses
  resources :bookings
  root :to => "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
