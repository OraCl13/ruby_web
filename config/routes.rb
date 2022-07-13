Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'sessions' }

  namespace :admin do
    resources :start_page, only: [:index]

    resources :trains do
      resources :vans, only: [:new, :create]
    end
    resources :railway_stations do
      patch :update_position, on: :member
    end

    resources :routs
    resources :vans, only: [:show]
    resources :tickets, only: [:index, :show, :destroy]
  end

  resources :trains do
    resources :tickets, only: [:new, :create]
  end

  resources :tickets, only: [:index, :show, :destroy]

  resource :search, only: [:show, :new, :edit] do
    post '/', to: 'searches#search'
  end

  root 'searches#show'
end
