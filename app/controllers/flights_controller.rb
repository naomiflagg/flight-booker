class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @dates = Flight.order(:date).pluck(:date)
    @flights = Flight.search(params[:search])
  end
end
