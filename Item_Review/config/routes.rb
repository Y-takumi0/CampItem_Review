Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  root to: 'homes#top'
  get "search" => "searches#search"

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'user/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    resources :items, only: [:index, :show, :new, :edit, :create, :update] do
      resources :reviews, only: [:index, :show, :create] do
        resources :comments, only: [:create]
      end
    end
    resources :users, only: [:index, :show, :edit, :update] do
      member do
      get :follows, :followers
      end
      resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
    end
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update] do
      resources :reviews, only: [:index, :update]
    end
    resources :users, only: [:index, :show, :update]
    resources :categories, only: [:index, :create, :edit, :update]
  end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end