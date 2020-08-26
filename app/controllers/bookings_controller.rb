class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: booking_params[:flight][:flight_id])
    @flight = Flight.find(@booking.flight_id)

    booking_params[:num_tickets].to_i.times do 
      @booking.passengers.build
    end
  end

  private

  def booking_params
    params.permit(:num_tickets, flight: [ :flight_id ])
  end
end
