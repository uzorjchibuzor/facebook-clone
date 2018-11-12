Rails.application.routes.draw do

  get 'friendships/create'
  post 'friendships/update', to: 'friendships#update'
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
  get '/notifications', to: 'users#notifications'
  get 'users/:id/notifications', to: 'users#notifications'
  get '/all_friends', to: 'users#all_friends'
  get 'users/:id/all_friends', to: 'users#all_friends'
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
