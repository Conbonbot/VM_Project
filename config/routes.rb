Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#new'
  get  '/home',   to: 'users#new'
  get  '/help',   to: 'users#help'
  get  '/about',  to: 'users#about'
  get  '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy'
  get  '/new_vm', to: 'vms#new'
  post '/new_vm', to: 'vms#create'
   
  resources :users
  resources :vms, only: [:create, :destroy]
  resources :account_activations, only: [:edit]
end
