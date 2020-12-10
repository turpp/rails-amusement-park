Rails.application.routes.draw do
  resources :rides
  resources :users
  resources :attractions
  root 'users#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  post '/go_on_ride', to: 'attractions#go_on_ride'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
