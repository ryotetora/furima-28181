Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  # ログイン新規登録に必要なルーティング自動でできる
  resources :users
  # とりあえず全てのアクション生成
  root to: "items#index"
end
