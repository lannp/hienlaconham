require 'api_constraints'
Rails.application.routes.draw do
  root 'static_pages#home'

  get 'static_pages/help'

  devise_for :users

  namespace :api, defaults: { format: :json }   do
   scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :posts, only: [:index, :show, :create, :update, :destroy]
      resources :votes, only: [:index, :show, :create, :destroy]
      resources :sessions, only: [:create, :destroy]
      resources :comments, only: [:index, :create, :update, :destroy]
      resources :users do
        resources :posts, only: [:index, :show, :create, :update, :destroy] do
          resources :votes, only: [:index, :show, :create, :destroy]
          resources :comments, only: [:index, :create, :update, :destroy]
        end
      end
      resources :follows, only: [:create, :destroy]
    end
  end

  # resources :users, only: [:index, :show, :edit, :update]
  # resources :posts
  # resources :votes


end
