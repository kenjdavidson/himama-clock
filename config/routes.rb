Rails.application.routes.draw do
  namespace :admin do
    resources :users

    get '/', to: 'sessions#login'
    get '/login', to: 'sessions#login'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#logout'
  end

  put '/', to: 'punch_clock#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'punch_clock#index'
end
