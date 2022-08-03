class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])

    @q = Register.ransack(params[:q])
    @results = @q.result(distinct: true)
  end

  def show
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :icon )
  end
end
