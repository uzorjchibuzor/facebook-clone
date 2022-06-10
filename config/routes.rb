# frozen_string_literal: true

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

  post '/search', to: 'users#search'
  get '/search', to: 'posts#index'

  get 'users/show'
  get '/notifications', to: 'users#notifications'
  get 'users/:id/notifications', to: 'users#notifications'
  get '/all_friends', to: 'users#all_friends'
  get 'users/:id/all_friends', to: 'users#all_friends'
  get 'posts/show'
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  get 'pages/home'
  resources :users
  resources :posts
  resources :comments
  resources :likes
  resources :friendships
end
