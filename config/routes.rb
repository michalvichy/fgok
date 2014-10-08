Rails.application.routes.draw do
  resources :articles
  resources :dashboards, only: [:index]

  root 'home#index'
end
