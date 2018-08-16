require "administrate/base_dashboard"

class VehicleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    driver: Field::BelongsTo.with_options(class_name: "User"),
    vehicle_type: Field::BelongsTo.with_options(class_name: "VehicleType"),
    id: Field::Number,
    gps_tracker_id: Field::Number,
    model: Field::String,
    vnumber: Field::String,
    type_id: Field::Number,
    engine_vol: Field::Number,
    driver_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :model,
    :vnumber,
    :driver,
    :vehicle_type,
    :gps_tracker_id
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :driver,
    :vehicle_type,
    :model,
    :vnumber,
    :engine_vol,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :vehicle_type,
    :model,
    :vnumber,
    :driver,
    :engine_vol,
    :gps_tracker_id
  ].freeze

  # Overwrite this method to customize how vehicles are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(vehicle)
    "Vehicle ##{vehicle.vnumber}"
  end
end
