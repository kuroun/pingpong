Rails.application.routes.draw do
  get 'leaderboards/index'

  resources :logs, :except => [:edit, :show]

  devise_for :users
  root to: "leaderboards#index"
  get '/history', to: 'home#history'
  get '/log',     to: 'home#log'
end
