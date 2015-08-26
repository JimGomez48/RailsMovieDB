Rails.application.routes.draw do
  root 'home#index'

  # static routes for serving angular apps
  get '*path' => 'home#index', as: :home_path

  # api resource routes
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :movies do
        resources :actors
        resources :directors
        resources :genres, only: [:index]
        resources :reviews, only: [:index, :show, :new, :create, :edit, :update]
      end
      resources :actors do
        resources :movies
      end
      resources :directors do
        resources :movies
      end
      resources :reviews, only: [:index, :show, :new, :create, :edit, :update]
    end
  end
end
