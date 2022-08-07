class BookingsController < ApplicationController
  def index
    @registers = Register.all
  end

  def new
    @register = Register.find(params[:booking][:register_id])
    @booking = Booking.new(booking_params)
    @days = (@booking.end_date - @booking.start_date).to_i
    @booking.total_price = (@register.price * @booking.person * @days).to_i
    @booking.user_id = current_user.id
    @booking.register_id = @register.id
    binding.pry
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    binding.pry

    if @booking.save
      flash[:notice] = "新規ルームを登録しました"
      redirect_to users_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  #ストロングパラメータ
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :person, :total_price)
  end
end
