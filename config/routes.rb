Rails.application.routes.draw do
  get 'activities/index'
  resources :posts
  resources :likes, only: [:show,:create,:destroy]
  post '/liked', to: 'likes#is_liked'
  # resources :friendships
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #search
  post '/headlines/search', to: 'headlines#search_results'
  post '/accounts/search', to: 'accounts#search_results'
  post '/people/search', to: 'accounts#search_results'

  get '/auth', to: 'accounts#show'
  post '/signup', to: 'accounts#create'
  get '/followees', to: 'accounts#followees'

  resources :friendships, only: [:create, :destroy]
  resources :activities
  resources :headlines
  resources :comments
  resources :accounts, only: [:show, :update]
  devise_for :accounts, controller: {
    confirmations: "confirmations"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
