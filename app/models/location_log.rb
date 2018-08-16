class LocationLog < ApplicationRecord
  MILE = 1609.344

  def vehicle
    Vehicle.where(gps_tracker_id: gps_tracker_id).first
  end

  def update_vehicle_location
    car = vehicle

    if car.blank?
      logger.error("Can not find attached vehicle for gps_tracker_id: #{gps_tracker_id}")
      return
    end

    tracker_id = data[0..5].to_i
    logger.error("Tracker id does not match #{gps_tracker_id} #{data}") if tracker_id != gps_tracker_id

    loc = car.vehicle_location
    loc ||= car.build_vehicle_location

    loc.speed = speed
    loc.lat = lat
    loc.lng = lng
    loc.save!
  end

  def lat
    lat_str = '0' + data[18..23]
    parse_coord(lat_str)
  end

  def lng
    lng_str = data[25..31]
    parse_coord(lng_str)
  end

  def speed
    data[15..17].to_i * MILE
  end

  def parse_coord(str)
    degree = str[0..2].to_i
    minutes = str[3..4].to_i
    seconds = str[5..6].to_i
    degree + (minutes + seconds/100.0) / 60
  end
end
