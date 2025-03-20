Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:new, :index, :show, :edit, :create, :destroy, :update]
  resources :users, only: [:show, :edit, :update]
  get '/about' => "homes#about"
  get 'users/new' => "users#new"
  get 'users/show' => "users#show"
  get 'users/edit' => "users#edit"
  get '/mypage' => "users#mypage"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
