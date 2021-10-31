Rails.application.routes.draw do
  get 'desigual/index'
  resources :categories
  resources :genders
  resources :nominals
  resources :trends
  resources :clothers
  resources :desigual
  root to: 'desigual#index'
end
