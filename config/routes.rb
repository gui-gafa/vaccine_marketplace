Rails.application.routes.draw do
  devise_for :users
  root to: 'vaccine_types#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :vaccine_types, only: [:index, :show]
end
