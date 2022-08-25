class RegistersController < ApplicationController
  before_action :set_register, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:index, :search]

  # GET /registers or /registers.json
  def index
    @registers = current_user.registers.all
  end

  # GET /registers/1 or /registers/1.json
  def show
    @register = Register.find(params[:id])
    @user = @register.user
    @booking = Booking.new
  end

  # GET /registers/new
  def new
    @register = Register.new
  end

  # GET /registers/1/edit
  def edit
  end

  # POST /registers or /registers.json
  def create
    @register = Register.new(register_params)
    @register.user_id = current_user.id

    if @register.save
      flash[:notice] = "新規ルームを登録しました"
      redirect_to register_path(@register)
    else
      flash.now[:notice] = "新規ルームの登録に失敗しました"
      render new_register_path
    end
  end

  # PATCH/PUT /registers/1 or /registers/1.json
  def update
    respond_to do |format|
      if @register.update(register_params)
        format.html { redirect_to register_url(@register), notice: "Register was successfully updated." }
        format.json { render :show, status: :ok, location: @register }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1 or /registers/1.json
  def destroy
    @register.destroy

    respond_to do |format|
      format.html { redirect_to registers_url, notice: "Register was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @results = @q.result(distinct: true)
    if @q_header
      @results = @q_header.result(distinct: true)
    end
  end

  private

    def set_q
      @q = Register.ransack(params[:q])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    #ストロングパラメーター設定
    def register_params
      params.require(:register).permit(:room_name, :introduction, :price, :address, :room_image, :user_id)
    end
end
