Rails.application.routes.draw do

  # devise for users 
  devise_for :users


  # HOME
  root to: 'home#index'
  get '/message', to: 'home#message'
  get 'help', to: 'home#help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
