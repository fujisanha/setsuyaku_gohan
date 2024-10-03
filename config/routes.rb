Rails.application.routes.draw do
  resources :events, only:[:new, :create, :update, :destroy, :edit]
  # ユーザー
  resources :users, only:[:index, :edit, :update, :show]

  # recipesとfavorites
  resources :recipes do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:index, :create]
  end
  get 'recipes/confirm/:id', to: "recipes#confirm", as: 'confirm'


  # デバイス
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  # root to: 'recipes#index'
  root to: 'homes#top'
  # homes
  get 'homes/top', as: 'top'
  get 'homes/about', as: 'about'
  get "users" => redirect("/users/sign_up")

  # ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  devise_for :admin, path: 'admin', controllers: {
    sessions: "admin/admins/sessions"
  }

  namespace :admin do
    root "users#index"
    resources :users, only: [:index, :show, :destroy]
    resources :comments, only: [:index, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
