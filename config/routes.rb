Rails.application.routes.draw do


  # post_forces
  get 'post_forces/index', to: 'post_forces#index'
  get 'post_forces/hoge', to: 'post_forces#hoge'
  # reposts
  resources :reposts, only:[:create, :destroy, :index]
  # posts
  resources :posts, only:[:index, :show, :new, :create, :destroy]
  # devise for users
  devise_for :users
  # users
  resources :users, only:[:index, :show, :edit, :update]

  # HOME
  root to: 'home#index'
  get '/message', to: 'home#message'
  get 'help', to: 'home#help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
