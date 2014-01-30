BallinHipster::Application.routes.draw do
  devise_for :users
  resources :wikis
  root to: 'wikis#index'
end