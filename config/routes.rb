Rails.application.routes.draw do

  resources :trains
  resources :railway_stations
  resources :train_routes

  get 'welcome/index'

  root 'welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
