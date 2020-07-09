class PlatformsController < Information::BaseController
  before_filter :fill_variables
  def update
    resource.buildings = params[:platform][:buildings]
    super
  end

  private

  def fill_variables
    @land_categories = LandCategory.accessible_by(current_ability)
    @municipalities = Municipality.accessible_by(current_ability)
    @companies = Company.accessible_by(current_ability)
    @ownership_types = OwnershipType.accessible_by(current_ability)
  end

  def resource_params
    allowed = [:permitted_uses, :municipality_id, :coords, :name, :platform_type, :description, :company_id, :owner_id, :legal_address,
               :contact_person, :contact_person_email, :contact_person_phone, :address, :area, :ownership_type_code,
               :expandable, :nearby_facilities, :nearest_houses_distance, :limitations, :land_category_code,
               :government_agency_providing_land, :cadastral_number, :sanitary_protection_zones,
               :transportation_driveways, :key, :buildings, :company_text,

               :region_distance, :city_distance, :road_distance, :airport_distance, :seaport_distance,

               :gas, :gas_details, :heating, :heating_details, :electricity, :electricity_details, :water,
               :water_details, :sewerage, :sewerage_details, :sewage_plants, :sewage_plants_details, :boiler_system,
               :boiler_system_details, :demo_mode]
    super(allowed, pictures: true)
  end
end