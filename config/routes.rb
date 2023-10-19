# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "intake/locations#new"
  namespace :intake do
    resources :locations, only: [:new, :create]
    resources :addresses, only: [:new, :create]
    resources :slots, only: [:new, :create]
  end

  namespace :subscriptions do
    resource :checkout_session, only: [:show]
  end
end
