Rails.application.routes.draw do
  get 'books' => 'book#index'
  resources :books,only: [:index, :show, :edit, :update]
  devise_for :users
  get 'users' => 'homes#about', as: 'about'
  # resources :post_images,only: [:new, :create, :index, :show, :destroy]
  resources :users,only: [:show, :edit, :update]
  root :to => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end