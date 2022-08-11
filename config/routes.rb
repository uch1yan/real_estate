Rails.application.routes.draw do
  resources :properties
  root "properties#index"
  resources :nearest_stations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
