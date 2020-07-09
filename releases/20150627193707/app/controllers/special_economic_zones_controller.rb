class SpecialEconomicZonesController < Information::BaseController
  before_filter :fill_variables

  private

  def fill_variables
    @special_economic_zone_types = SpecialEconomicZoneType.accessible_by(current_ability)
    @municipalities = Municipality.accessible_by(current_ability)
  end

  def resource_params
    allowed = [:name, :coords, :sez_type, :municipality_id, :company, :contact_person, :contact_phone,
    :contact_email, :address, :free_square, :residents, :authorized_activities, :protection_zones,
    :transport_driveways, :resident_privileges, :central_region_distance, :city_distance, :road_distance,
    :airport_distance, :seaport_distance, :gas, :gas_details, :heating, :heating_details, :electricity,
    :electricity_details, :water, :water_details, :sewerage, :sewerage_details, :sewage_plants, :sewage_plants_details,
    :special_economic_zone_type_code, :boiler_system, :boiler_system_details, :demo_mode]
    super(allowed, pictures: true)
  end
end
