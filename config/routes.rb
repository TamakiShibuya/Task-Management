Rails.application.routes.draw do
  namespace :admin do
    get 'users/new'
    get 'users/edit'
    get 'users/show'
    get 'users/index'
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessiions#create'
  delete '/logout', to: 'sessions#destroy'
  
  namespace :admin do
    resources :users
  end

  root 'tasks#index'
  resources :tasks
end
