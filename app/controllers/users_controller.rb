class UsersController < ApplicationController
  def index
    @q = Register.ransack(params[:q])
    @results = @q.result(distinct: true)
  end
end
