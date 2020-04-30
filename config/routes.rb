Rails.application.routes.draw do
  root to: 'kalendar#home'

  # User Authentication
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
end
