Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#new'
  get  '/home',   to: 'users#new'
  get  '/help',   to: 'users#help'
  get  '/about',  to: 'users#about'
  get  '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy'
  resources :users
end
