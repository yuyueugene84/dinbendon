Rails.application.routes.draw do
  # 設定首頁
  root 'orders#index'

  resources :orders
  # 我只需要讓使用者註冊即可，多餘的 API 不要產出
  resources :users, only: [:new, :create]

  # /login 是連結到使用者登入的表單，登出是 /logout
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # /register 能夠連到使用者註冊頁面
  get '/register', to: 'users#new'
end
