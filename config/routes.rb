Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  get 'purchase/pay'
  get 'card/new'
  get 'card/show'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'items#index'
  
  resources :items, only:[:index,:new,:create,:show, :destroy, :edit]
  resources :users, only: [:index, :edit, :update, :show]
  resources :cards, only: [:index, :new]
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
end
