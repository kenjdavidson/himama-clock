Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :users
  end

  namespace :profile do
    get '/', to: 'profile#show'
  end

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'

  post '/', to: 'punch_clock#create'

  # Defines the root path route ("/")
  root 'punch_clock#index'
end
