Rails.application.routes.draw do
  resources :registrations
  resources :categories
  resources :genders
  resources :nominals
  resources :trends
  resources :clothers
  resources :desigual
  # root to: 'desigual#index'
  get '/' => 'users#index'
  post '/sessions' => 'sessions#create'
  post '/users' => 'users#create'
  get '/dashboard' => 'clothers#index'

end
