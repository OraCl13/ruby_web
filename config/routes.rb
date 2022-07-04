Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routs

  root "railway_stations#index"
end
