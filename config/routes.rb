Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessiions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'tasks#index'
  resources :tasks
end
