Rails.application.routes.draw do
  resources :friendships
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth', to: 'accounts#show'
  post '/signup', to: 'accounts#create'

  resources :headlines
  resources :comments
  resources :accounts
  devise_for :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
