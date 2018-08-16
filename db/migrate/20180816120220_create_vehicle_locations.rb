class CreateVehicleLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicle_locations do |t|
      t.integer :vehicle_id, null: false
      t.decimal :lat, null: false, precision: 10, scale: 6
      t.decimal :lng, null: false, precision: 10, scale: 6
      t.integer :speed, null: false, default: 0

      t.timestamps
    end

    add_column :vehicles, :gps_tracker_id, :integer
  end
end
