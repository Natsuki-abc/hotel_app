class BookingsController < ApplicationController
  def index
    @registers = Register.all
  end
end
