Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  get 'auth/:provider/callback' => 'sessions#callback'
  resource :sessions, only: [:create, :destroy]
  resources :users, only: [:create, :edit, :update]
  resources :friend_relations, only: [:create] do
    new do
      post :confirm
      post :reject
    end
  end
  resources :places, only: [:show, :index]
end
