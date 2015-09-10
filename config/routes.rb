Rails.application.routes.draw do
  root 'application#index'

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
      resources :companies do
        resources :movies
      end
      resources :reviews, only: [:index, :show, :new, :create, :edit, :update]
    end
  end

  # static routes for serving AngularJS apps
  get '*path' => 'application#index'
end
