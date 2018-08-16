require 'test_helper'

class LocationLogTest < ActiveSupport::TestCase
  test "update_vehicle_location" do
    gps_tracker_id = 62_109
    type = VehicleType.create(name: 'Bus')
    func = Function.create(name: 'Driver')
    driver = User.create(
      email: 'a.a@a.com',
      first_name: 'Ion',
      last_name: 'Ciocan',
      password: '123456',
      function_id: func.id
    )
    bus = Vehicle.create(
      vehicle_type: type,
      model: 'Man',
      vnumber: 'ABC147',
      driver: driver,
      engine_vol: 5000,
      gps_tracker_id: gps_tracker_id
    )

    log = LocationLog.create(
      gps_tracker_id: gps_tracker_id,
      logged_at: Time.now,
      data: '062109011000254000465982N0285278E2'
    )

    log.update_vehicle_location
    loc = bus.vehicle_location
    assert_equal 0, loc.speed
    assert_equal 46.997, loc.lat.to_f
    assert_equal 28.879667, loc.lng.to_f
  end
end
