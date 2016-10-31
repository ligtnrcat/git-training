Rails.application.routes.draw do
  root to: 'books#index'
  get '/search' => 'books#search'
  resources :books, except: %i(edit update)
end
