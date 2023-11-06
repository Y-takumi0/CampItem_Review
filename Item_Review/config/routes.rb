Rails.application.routes.draw do
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
     resources :reviews, only: [:index, :create]
    end
    resources :users, only: [:show, :edit, :update]
    resources :comments, only: [:update, :create]
    resources :follows, only: [:create, :index, :update]
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :users, only: [:index, :show, :update]
    resources :reviews, only: [:new, :show, :update, :create, :destroy]
    resources :comments, only: [:update]
    resources :categories, only: [:index, :create, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
