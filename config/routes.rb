Rails.application.routes.draw do
  
  # get 'welcome/index'
  get '/search', to: 'vehicles#search'
  post '/bookings/new', to: 'bookings#new'
  post '/vehicles/search', to: 'vehicles#search'
  resources :vehicles
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # get '/user/sign_out' => 'devise/sessions#destroy'
  resources :users
  #root 'users#index'
  resources :addresses
  resources :bookings
  root :to => "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
