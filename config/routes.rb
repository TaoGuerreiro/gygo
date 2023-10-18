Rails.application.routes.draw do
  root "pages#show"
  get "landing", to: "pages#show"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
