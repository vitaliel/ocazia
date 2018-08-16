class CreateLocationLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :location_logs do |t|
      t.integer :gps_tracker_id, null: false
      t.datetime :logged_at, null: false
      t.string :data, null: false
      t.datetime :created_at, null: false
    end
  end
end
