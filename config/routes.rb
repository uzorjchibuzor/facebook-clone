Rails.application.routes.draw do

  # devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  #     }
  get 'users/show'
  devise_for :users
  get 'pages/home'
  root 'pages#home'
  resources :users
  resources :posts
end
