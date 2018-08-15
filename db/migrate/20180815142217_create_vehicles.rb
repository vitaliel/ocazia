class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :model, null: false
      t.string :vnumber, limit: 15, null: false
      t.integer :vehicle_type_id, null: false
      t.integer :engine_vol, null: false
      t.integer :driver_id, null: false

      t.timestamps
    end
  end
end
