Rails.application.routes.draw do


  resources :trains do
    resource :carriages, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
  end
  resources :routes
  resources :carriages

  resource :search, only: [:show, :create]


  get 'welcome/index'

  root 'welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
