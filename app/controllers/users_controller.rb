class UsersController < ApplicationController
  def index
    @q = Register.ransack(params[:q])
    @results = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new(user_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to edit_user_path(@user)
    else
      flash.now[:notice] = "プロフィールの更新に失敗しました"
      render "edit"
    end
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :icon )
  end
end
