Rails.application.routes.draw do

  # comment
  resources :comments, only:[:index, :create, :destroy]
  # post_forces
  get 'post_forces/index', to: 'post_forces#index'
  get 'post_forces/hoge', to: 'post_forces#hoge'
  get 'post_forces/test', to: 'post_forces#test'
  get 'post_forces/link', to: 'post_forces#link'

  # reposts
  resources :reposts, only:[:create, :destroy, :index]
  # posts
  resources :posts, only:[:index, :show, :new, :create, :destroy]
  # devise for users
  devise_for :users
  # users
  resources :users, only:[:index, :show, :edit, :update]

  # messages
  resources :messages, only:[:index, :create, :destroy]
  # HOME
  root to: 'home#index'
  get 'help', to: 'home#help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
