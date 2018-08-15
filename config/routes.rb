# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :functions
      resources :vehicles
      resources :vehicle_types

      root to: "users#index"
    end
  devise_for :users
  root to: "pages#welcome"
end
