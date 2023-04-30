Rails.application.routes.draw do
  
  resources :uploads, only: %i[create destroy]
  #login routes
  root 'sessions#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  #register routes
  get '/register' => 'users#new'
  post '/users' => 'users#create'

  get '/storage' => 'storage#index'
end
