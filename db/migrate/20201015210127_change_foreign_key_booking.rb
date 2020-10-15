class ChangeForeignKeyBooking < ActiveRecord::Migration[5.2]
  def change
    remove_reference :flights, :booking, foreign_key: true
    remove_reference :bookings, :passenger, foreign_key: true
    add_reference :passengers, :booking, foreign_key: true
    add_reference :bookings, :flight, foreign_key: true
  end
end
