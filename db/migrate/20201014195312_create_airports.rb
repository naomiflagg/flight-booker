class CreateAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :airports do |t|
      t.string :code, index: { unique: true }
      t.string :city
      
      t.timestamps
    end
  end
end
