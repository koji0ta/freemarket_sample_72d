Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'items#index'
  
  resources :purchase, only: :index
  resources :items, only:[:index,:new,:create,:show, :destroy]
  resources :users, only: [:index, :edit, :update]
  resources :cards, only: [:index, :new]
  
end
