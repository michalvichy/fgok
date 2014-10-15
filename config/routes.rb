Rails.application.routes.draw do

  resources :albums, only: [:index, :show]
  resources :articles, only: [:index, :show]
  resources :dashboards, only: [:index]
  resources :images, only: [:index, :show]

  namespace :dashboard do
    resources :articles
  end

  root 'home#index'
end
