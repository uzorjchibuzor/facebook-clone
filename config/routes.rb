Rails.application.routes.draw do

  get 'comments/new'
  get 'comments/create'
  # devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  #     }
  get 'users/show'
  get 'posts/show'
  devise_for :users
  get 'pages/home'
  root 'pages#home'
  resources :users
  resources :posts
end
