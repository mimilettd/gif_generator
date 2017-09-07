Rails.application.routes.draw do
  root to: "main#index"

  resources :users, only: [:new, :create, :show]

  delete 'logout', to: "sessions#destroy"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
end
