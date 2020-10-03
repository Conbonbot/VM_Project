Rails.application.routes.draw do
  root 'users#home'
  get '/home',  to: 'users#home'
  get '/help',  to: 'users#help'
  get '/about', to: 'users#about'
end
