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
  # resources :vehicles do
  #   resources :bookings
  # end  
  # delete 'vehicles/:id' => "vehicles#destroy"
  delete 'vehicles/:id/delete' => 'vehicles#destroy', as: 'vehicles_delete'
  get '/vehicles/:id/delete' => 'vehicles#destroy'
  
  resources :addresses
  resources :bookings
  root :to => "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
