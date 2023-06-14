Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"  
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  
  
  get "home/about" , to:"homes#about" , as:"about"
  resources :books, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end
