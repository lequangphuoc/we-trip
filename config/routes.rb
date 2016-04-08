Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :locations, only: [:show, :index]

  get 'auth/:provider/callback' => 'sessions#callback'
  resource :sessions, only: [:create, :destroy]
  resources :users, only: [:create, :edit, :update]
end
