# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

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

    resource :account, only: [:show], controller: "account", module: :client
    resources :addresses, only: [:edit, :update], module: :client
    resources :slots, only: [:edit, :update], module: :client
  end
end
