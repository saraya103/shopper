Rails.application.routes.draw do
  devise_for :users
  root to: 'notes#index'
  resources :notes, only: [:index, :new, :create, :show], param: :character do
    resources :items, only: [:index, :new, :create]
  end
  resources :users, only: [:edit, :update]
end