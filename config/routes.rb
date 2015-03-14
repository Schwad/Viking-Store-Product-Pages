Rails.application.routes.draw do

  root 'admins#index'

  namespace :admin do
    resources :users do
      resources :credit_cards, only: [:destroy]
      resources :orders, shallow: true
      resources :addresses, shallow: true
    end
    resources :categories
    resources :products
    resources :addresses, only: [:index, :new, :create]
    resources :dashboards, only: [:index]
    resources :admins, only: [:index]
  end
end
