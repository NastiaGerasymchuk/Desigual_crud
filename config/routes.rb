Rails.application.routes.draw do
  resources :posts
  resources :registrations
  resources :categories
  resources :genders
  resources :nominals
  resources :trends
  resources :clothers
  resources :desigual
  # root to: 'desigual#index'
  get '/' => 'users#index'
  # post '/sessions' => 'sessions#create'
  post '/users' => 'users#create'
  get '/dashboard' => 'clothers#index'
  post "home/group_message", to: "home#group_message"
  post "home/private_message", to: "home#private_message"
  post "home/send_hello", to: "home#send_hello", as: "send_hello"
  get "sessions/create", to: "sessions#create"

end
