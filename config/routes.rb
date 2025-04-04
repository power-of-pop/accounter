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

# ユーザー側のルーティング
scope module: :public do
  root :to =>"homes#top"
  get "about" => "homes#about"
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
