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

  authenticate :user do
    namespace :subscriptions do
      resource :checkout_session, only: [:show]
      resource :confirmation, only: [:show]
    end

    namespace :client do
      resource :account, only: [:show], controller: "account"
    end
  end
end
