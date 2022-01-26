Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "sessions/new" => 'sessions#new'
  get "sessions/login" => 'sessions#login'
  post "sessions/new" => 'sessions#create'
  delete "sessions" => 'sessions#logout'
  
  post "lenders" => 'lenders#create'
  get "lenders" => 'lenders#show'
  post "lenders/:id" => 'lenders#update'
  
  post "borrowers" => 'borrowers#create'
  get "borrowers" => 'borrowers#show'  
end
