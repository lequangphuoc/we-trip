Rails.application.routes.draw do
  get 'attractions/create'

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

  resources :trips, only: [:new, :edit, :create, :update, :show] do
    resources :schedule_days, only: [:create] do
      resources :attractions, only: [:create]
    end
  end

  resource :user_trips, only: [:create, :destroy]
  resources :places, only: [:show, :index]
end
