Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #login routes
  resources :upload
  root 'sessions#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  #register routes
  get '/register' => 'users#new'
  post '/users' => 'users#create'

  get '/storage' => 'storage#index'
end
