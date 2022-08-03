class ApplicationController < ActionController::Base
    before_action :set_q_for_register

    def set_q_for_register
        @q_header = Register.ransack(params[:q])
    end

    def after_sign_in_path_for(resource)
        if current_user
            flash[:notice] = "ログインに成功しました"
            users_path
        else
            flash[:notice] = "新規登録が完了しました"
            edit_user_registration_path
        end
    end

    def after_sign_out_path_for(resource)
        users_path
    end
end
