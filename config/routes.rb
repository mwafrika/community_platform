# frozen_string_literal: true

Rails.application.routes.draw do
  root 'group_tabs#index'

  devise_for :users

  resources :users, only: %i[show edit update]

  # namespace :groups do

  #   resources :all, :my, :member, only: [:index]

  # end

  resources :group_tabs, only: %i[index] do
    collection do
      get :created

      get :belonging
    end
  end

  resources :groups do
    member do
      post 'join'

      delete 'leave'
    end

    resources :posts, only: %i[new create show edit update destroy] do
      resources :comments, only: %i[create destroy]
    end
  end

  resources :comments, only: %i[edit update]
end
