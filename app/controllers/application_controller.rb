class ApplicationController < ActionController::Base
  before_action :basic_auth
  # 全てのアクセスに対しBASIC認証を適用
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
    # デフォルトで使えないパラメータの許可
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      # 環境変数設定し、BASIC認証に利用
    end
  end
end
