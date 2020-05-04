Rails.application.routes.draw do
  root to: 'kalendar#home'

  # User Registration
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # User Authentication
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
end
