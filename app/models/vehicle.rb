class Vehicle < ApplicationRecord
  belongs_to :driver, class_name: "User", foreign_key: :driver_id
  belongs_to :vehicle_type

  validates_presence_of :model, :vnumber, :engine_vol, :vehicle_type_id, :driver_id
  validates_uniqueness_of :vnumber
end
