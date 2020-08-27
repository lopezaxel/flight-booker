class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight][:flight_id])

    params[:num_tickets].to_i.times do 
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(flight_id: params[:flight_id].to_i)

    passengers_params[:passengers_attributes].each do |passenger|
      @booking.passengers.build(passenger[1]) 
    end

    @booking.save

    redirect_to booking_path(@booking)
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

  def passengers_params
    params.require(:booking).permit(passengers_attributes: [:name, :email])
  end
end
