class AddAndRemoveColumnsFromFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :date, :date
    add_column :flights, :time, :time
    remove_column :flights, :datetime, :datetime
  end
end
