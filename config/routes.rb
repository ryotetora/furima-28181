Rails.application.routes.draw do
  # ログイン新規登録に必要なルーティング自動設定
  devise_for :users
  root to: "items#index"
  # 全てのアクション生成
  resources :users
  resources :items do
    resources :orders, only: [:index, :create]
  end
end
