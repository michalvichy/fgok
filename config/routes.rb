Rails.application.routes.draw do
  resources :albums

  resources :articles, only: [:index, :show]
  resources :dashboards, only: [:index]

  namespace :dashboard do
    resources :articles
  end

  root 'home#index'
end
