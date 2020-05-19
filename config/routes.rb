Rails.application.routes.draw do
  root to: 'kalendar#home'

  # User Registration
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # User Authentication
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # User Settings
  resources :users
  get '/users/:id/tasks', to: 'tasks#show'

  # Task Creation
  get  '/tasks', to: 'tasks#new'
  post '/tasks', to: 'tasks#create'
  delete '/tasks', to: 'tasks#destroy'
end
