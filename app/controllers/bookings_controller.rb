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
      @booking.passengers.each do |pass|
        PassengerMailer.with(passenger: pass, booking: @booking).after_booking_email.deliver_now
      end
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
