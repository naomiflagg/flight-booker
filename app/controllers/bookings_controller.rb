class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:booking][:flight])
    num_passengers = params[:booking][:num_passengers].to_i
    @booking = Booking.new
    num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      render 'show'
    else
      @flight = Flight.find(params[:flight_id])
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
end
