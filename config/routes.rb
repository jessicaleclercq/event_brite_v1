Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'

  resources :attendances
  resources :events
  resources :users
  resources :charges

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

