Rails.application.routes.draw do
  devise_for :users
  get 'books' => 'books#index'
  resources :books,only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :book_comments,only: [:create,:destroy]
    resource :favorites,only: [:create,:destroy]
  end
  get '/home/about' => 'homes#about', as: 'about'
  get "/search" => "searches#search"
  # get 'users' => 'users#index', as: 'users'
  # resources :post_images,only: [:new, :create, :index, :show, :destroy]
  resources :users,only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  root :to => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end