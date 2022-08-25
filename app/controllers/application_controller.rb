class ApplicationController < ActionController::Base
    before_action :set_q_for_register
    before_action :configure_permitted_parameters, if: :devise_controller?

    def set_q_for_register
        @q_header = Register.ransack(params[:q])
    end

    #ログイン後の画面
    def after_sign_in_path_for(resource)
        if current_user
            flash[:notice] = "ログインに成功しました"
            users_path
        end
    end

    #ログアウト後の画面
    def after_sign_out_path_for(resource)
        users_path
    end

    private

    #userのストロングパラメーター
    def configure_permitted_parameters
        #新規登録時
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        #情報更新時
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
