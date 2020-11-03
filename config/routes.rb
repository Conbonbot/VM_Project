Rails.application.routes.draw do
  root 'users#new'
  get '/home',  to: 'users#new'
  get '/help',  to: 'users#help'
  get '/about', to: 'users#about'
  resources :users
end
