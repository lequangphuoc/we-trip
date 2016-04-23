Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  get 'auth/:provider/callback' => 'sessions#callback'
  resource :sessions, only: [:create, :destroy]

  resources :friend_relations, only: [:create, :new]
  post 'friend_relations/confirm' => 'friend_relations#confirm'
  post 'friend_relations/reject' => 'friend_relations#reject'

  resources :users, only: [:create, :edit, :update] do
    collection do
      get :friends, :available_friends
    end
  end

  resources :regions do
    collection do
      get :all
    end
  end

  resources :trips, only: [:new, :edit, :create, :update, :show] do
    resources :schedule_days, only: [:create, :destroy]
    member do
      put :publish
      get :clone
      get :available_friends
      get :budget_plan
      get :gallery
    end
  end

  resources :schedule_days, only: [] do
    resources :attractions, only: [:create, :destroy]
    member do
      post :sort
    end
  end

  resource :user_trips, only: [:create, :destroy]
  resources :places, only: [:show, :index]
  resources :budget_items, only: [:create, :destroy, :update]
  resources :attachments, only: [:create]
  resources :notifications
end
