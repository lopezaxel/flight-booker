class FlightsController < ApplicationController
  def index
    @from_options = Flight.all.map { |f| [f.from_airport.code, f.from_airport_id] }
    @to_options = Flight.all.map { |f| [f.to_airport.code, f.to_airport_id] }
    @date_options = Flight.all.map { |f| [f.date_formatted, f.date] }.uniq
    @num_tickets_options = [['1', 1], ['2', 2], ['3', 3], ['4', 4]]

    @available_flights = Flight.where("from_airport_id = ? AND to_airport_id = ? AND date = ?", params[:from_id], params[:to_id], params[:date])

    console
  end

  private

    def flight_params
      params.permit(:from_id, :to_id, :date, :num_tickets, :flight) 
    end
end
