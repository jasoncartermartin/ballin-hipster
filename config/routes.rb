BallinHipster::Application.routes.draw do
  get "collaborators/create"
  get "collaborators/destroy"
  devise_for :users
  resources :wikis
  root to: 'wikis#index'

  resources :collaborators
end