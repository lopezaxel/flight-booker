class FixAssociationPassengerBooking < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :passenger_id
    add_column :passengers, :booking_id, :integer
  end
end
