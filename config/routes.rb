Rails.application.routes.draw do
  resources :labels
  namespace :admin do
    resources :users
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'tasks#index'
  resources :tasks
end
