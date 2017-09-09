Rails.application.routes.draw do
  root to: "main#index"

  resources :users, only: [:new, :create, :show] do
    resources :gifs, only: [:index, :create]
  end

  delete 'logout', to: "sessions#destroy"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"

  namespace :admin do
    resources :categories, only: [:new, :create]
    resources :gifs, only: [:new, :create]
  end

  resources :categories, only: [:index, :show, :destroy]

  resources :gifs, only: [:index]
end
