Rails.application.routes.draw do
  get 'user_trips/add'

  get 'user_trips/remove'

  get 'home/index'
  root 'home#index'

  get 'auth/:provider/callback' => 'sessions#callback'
  resource :sessions, only: [:create, :destroy]

  resources :friend_relations, only: [:create]
  post 'friend_relations/confirm' => 'friend_relations#confirm'
  post 'friend_relations/reject' => 'friend_relations#reject'

  resources :users, only: [:create, :edit, :update] do
    collection do
      get :friends
    end
  end

  resources :regions do
    collection do
      get :all
    end
  end

  resources :places, only: [:show, :index]
  resources :user_trips, only: [:create, :destroy]
  resources :trips, only: [:new, :edit, :create, :update, :show]
end
