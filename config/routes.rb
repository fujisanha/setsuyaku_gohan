Rails.application.routes.draw do
  
  # recipes
  resources :recipes
  get 'recipes/confirm/:id', to: "recipes#confirm", as: 'confirm'
  resource :favorite, only: [:create, :destroy]

  
  # デバイス
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  
  # homes
  root to: 'homes#top'
  get 'homes/about', as: 'about'
  get "users" => redirect("/users/sign_up")
  
  # ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
