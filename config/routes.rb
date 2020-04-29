Rails.application.routes.draw do
  get '/home',   to: 'kalendar#home'
  get '/signup', to: 'users#new'
end
