BallinHipster::Application.routes.draw do
  get "subscriptions/create"
  get "subscriptions/destroy"
  get "collaborators/create"
  get "collaborators/destroy"
  devise_for :users
  
  resources :wikis
  
  resources :subscriptions, only: [:create, :destroy]

  resources :collaborators

  resources :charges

  root to: 'wikis#index'
end