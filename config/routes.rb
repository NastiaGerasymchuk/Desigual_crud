Rails.application.routes.draw do
  resources :categories
  resources :genders
  # , except: [:destroy]
  # delete 'genders/:id/delete' => 'genders#destroy', as: 'genders_delete'
  # get '/genders/:id/delete' => 'genders#destroy'
  resources :nominals
  resources :trends
  resources :clothers
end
