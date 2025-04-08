Rails.application.routes.draw do
# ユーザー用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# 管理者側のルーティング
namespace :admin do
  resources :users, only: [:index, :show]
  resources :categories, only: [:new, :index, :show, :edit, :update, :destroy]
  resources :transactions, only: [:new, :index, :show, :destroy]
end

# ユーザー側のルーティング
scope module: :public do
  root :to =>"homes#top"
  get "about" => "homes#about"

  resources :users, only: [:index, :show, :edit, :update]
  resources :categories, only: [:new, :index, :show, :create, :edit, :update, :destroy]
  resources :transactions, only: [:new, :index, :show, :create, :edit, :update, :destroy]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
