Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top', as: 'root'
  get 'home/about' => 'homes#about'
  #home/aboutのURLに飛んだ時、homesコントローラのindexアクションを実行
  resources :books
  resources :users, only: [:show, :edit, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
