Rails.application.routes.draw do
#  devise_for :admins
#  root to: 'books#search'
  get root to: 'books#search'
  get '/book/:id' => 'books#show'
end
