class IndustrialParksController < Information::BaseController
  before_filter :fill_variables

  private

  def fill_variables
    @municipalities = Municipality.accessible_by(current_ability)
  end

  def resource_params
    allowed = [:municipality_id, :name, :park_type, :description, :coords, :company, :legal_address,
               :contact_person, :contact_phone, :contact_email, :address, :free_square, :residents,
               :nearest_houses_distance, :authorized_activities, :protection_zones, :transport_driveways,
               :services, :central_region_distance, :another_region_distance, :city_distance, :road_distance,
               :airport_distance, :seaport_distance, :gas, :gas_details, :heating, :heating_details,
               :electricity, :electricity_details, :water, :water_details, :sewerage, :sewerage_details,
               :sewage_plants, :sewage_plants_details, :boiler_system, :boiler_system_details, :demo_mode]
    super(allowed)
  end
end
