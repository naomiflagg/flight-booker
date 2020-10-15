class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  def self.search(search)
    return unless search

    Flight.where(departure_airport: search[:departure_airport],
      arrival_airport: search[:arrival_airport], date: search[:date])
  end

  def clean_time
    time.strftime("%H:%M")
  end
end
