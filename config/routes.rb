Rails.application.routes.draw do
  
  get 'items/index'
  devise_for :users
  # ログイン新規登録に必要なルーティング自動設定
  resources :users
  resources :items
  resources :orders
  # 全てのアクション生成
  root to: "items#index"

end
