Rails.application.routes.draw do
  resources :trains do
    resources :vans, only: [:new, :create]
    resources :tickets, only: [:new, :create]
  end

  resources :railway_stations do
    patch :update_position, on: :member
  end

  resources :routs
  resources :vans, only: [:show]
  resources :users
  resources :tickets, only: [:index]

  root 'searches#show'

  resource :search, only: [:show, :new, :edit] do
    post '/', to: 'searches#search'
  end
end
