class IndustrialPark < ActiveRecord::Base

  default_scope order('id ASC')

  belongs_to :municipality

  validates :name, :coords, :municipality_id, :description, :legal_address, :contact_person,
            :contact_phone, :contact_email, :address, :free_square, :authorized_activities,
            :central_region_distance, :another_region_distance, :city_distance, :road_distance,
            :airport_distance, :seaport_distance, :presence => true

  validates :gas, :heating, :electricity, :water, :sewerage, :sewage_plants,
            :boiler_system, :boolean => true

  translates  :name, :park_type, :description, :company, :legal_address,
              :contact_person, :contact_phone, :contact_email, :address, :residents, :authorized_activities,
              :protection_zones, :transport_driveways, :services, :gas_details, :heating_details, :electricity_details,
              :water_details, :sewerage_details, :sewage_plants_details, :boiler_system_details

  def export
    self.attributes.delete_if { |k, v| v.blank? }
  end
end