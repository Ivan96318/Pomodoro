# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  get 'sign_up', action: :new, controller: 'sign_up'
  post 'sign_up', action: :create, controller: 'sign_up'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :projects do
    resources :tickets, except: [:index]
  end
end
