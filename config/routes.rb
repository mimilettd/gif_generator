Rails.application.routes.draw do
  root to: "main#index"

  resources :users, only: [:new, :create, :show]

  delete 'logout', to: "sessions#destroy"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"

  namespace :admin do
    resources :categories, only: [:new]
  end

  resources :categories, only: [:index, :show, :destroy]
end
