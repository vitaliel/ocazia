class VehicleType < ApplicationRecord
  has_many :vehicles, foreign_key: :type_id
end
