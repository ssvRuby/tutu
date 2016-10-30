Rails.application.routes.draw do

  # Add for devise
  devise_for :users

  namespace :admin do
    resources :trains do
      resource :carriages, shallow: true
    end
    resources :railway_stations do
      patch :update_position, on: :member
    end
    resources :routes
    resources :carriages
  end

  resources :tickets
  resource :search, only: [:show, :create]


  get 'welcome/index'

  root 'welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
