class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @register = Register.find(params[:booking][:register_id])
    @booking = Booking.new(booking_params)
    @days = (@booking.end_date - @booking.start_date).to_i
    @booking.total_price = (@register.price * @booking.person * @days).to_i
    @booking.user_id = current_user.id
    @booking.register_id = @register.id
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    if @booking.save
      flash[:notice] = "新規予約を作成しました"
      redirect_to booking_path(@booking)
    else
      flash.now[:notice] = "新規予約に失敗しました"
      @register = Register.find(params[:booking][:register_id])
      @days = (@booking.end_date - @booking.start_date).to_i
      @booking.total_price = (@register.price * @booking.person * @days).to_i
      @booking.user_id = current_user.id
      @booking.register_id = @register.id
      render "new"
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @register = @booking.register
  end

  def edit
  end

  def update
  end

  def destroy
  end

  #ストロングパラメータ
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :person, :total_price, :register_id, :user_id)
  end
end
