Rails.application.routes.draw do
  resources :trains do
    resources :vans, only: [:new, :create]
  end
  resources :railway_stations
  resources :routs
  resources :vans, only: [:show]

  root "railway_stations#index"
end