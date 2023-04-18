class ApplicationController < ActionController::Base


  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|

      # username == 'admin' && password == '2222'
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end

  # private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
#   # privateは１番上に書いたらその下からの行はPRIVATEのものと認識をするので書かなくても大丈夫

end

    # private
    # def configure_permitted_parameters  # メソッド名は慣習
    #   # deviseのUserモデルにパラメーターを許可
    #   devise_parameter_sanitizer.permit(:deviseの処理名, keys: [:許可するキー])
    # end
