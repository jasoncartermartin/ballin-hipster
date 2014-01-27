BallinHipster::Application.routes.draw do
  resources :wikis
  root to: 'wikis#index'
end