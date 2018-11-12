Rails.application.routes.draw do

  get 'friendships/create'
  get 'friendships/update'
  get 'friendships/destroy'
  post 'friendships/create', to: 'friendships#create'
  get 'likes/new'
  post 'likes/create', to: 'likes#create'
  get 'likes/destroy'
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
  resources :comments
  resources :likes
  resources :friendships
end
