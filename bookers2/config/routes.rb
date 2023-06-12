Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]

  root to: "homes#top"
  
  
get "home/about" , to:"homes#about" , as:"about"
end
