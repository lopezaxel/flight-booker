class Flight < ApplicationRecord
  has_many :bookings

  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"

  def date_formatted
    self.date.strftime("%m/%d/%Y")
  end
end
