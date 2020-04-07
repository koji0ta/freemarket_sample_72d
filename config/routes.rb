Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'items#index'
  resources :purchase, only: :index
  resources :items, only:[:index,:new, :show]
  resources :users, only: [:index, :edit, :update]
end
