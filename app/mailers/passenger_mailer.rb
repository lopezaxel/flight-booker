class PassengerMailer < ApplicationMailer
  default from: 'flightbookerteam@protonmail.com'

  def thank_you_email
    @passenger = params[:passenger]
    @flight = @passenger.booking.flight 
    mail(to: @passenger[:email], subject: 'Thank You for using Flight Airline Booking services')
  end
end
