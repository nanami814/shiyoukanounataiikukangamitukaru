Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'dashboards#index'
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:index, :create, :destroy]
  end

  scope module: :public do
  
    root to: "homes#top"

    devise_for :users

    resources :posts, only: [:new, :index, :show, :edit, :create, :destroy, :update] do
      resources :post_comments
    end
    
    resources :users, only: [:index,:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    
    get '/about' => "homes#about"
    get 'users/new' => "users#new"
    get 'users/show' => "users#show"
    get 'users/edit' => "users#edit"
    get '/mypage' => "users#mypage"
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    
  resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
    resource :group_users, only: [:create, :destroy]
    resources :event_notices, only: [:new, :create]
    get "event_notices" => "event_notices#sent"
  end
  
  
  get '/search', to: 'searches#search'
  end
end
