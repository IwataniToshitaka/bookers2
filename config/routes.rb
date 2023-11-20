Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top', as: 'root'
  get 'homes/about' => 'homes#index'
  resources :books, only: [:new, :create, :index, :edit, :show, :destroy]
  resources :users, only: [:show, :edit, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
