Rails.application.routes.draw do
  resources :likes
  resources :friendships
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth', to: 'accounts#show'
  post '/signup', to: 'accounts#create'
  get '/followees', to: 'accounts#followees'

  resources :headlines
  resources :comments
  resources :accounts
  devise_for :accounts, controller: {
    confirmations: "confirmations"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
