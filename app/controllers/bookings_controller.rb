class BookingsController < ApplicationController
  def index
    @registers = Register.all
  end

  def new
    @register = Register.find(params[:booking][:register_id])
    @booking = Booking.new
    binding.pry
    
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
