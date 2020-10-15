class AddReferencesToFlights < ActiveRecord::Migration[5.2]
  def change
    add_reference :flights, :booking, foreign_key: true
  end
end
