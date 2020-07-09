class SpecialEconomicZone < ActiveRecord::Base

  default_scope order('id ASC')

  belongs_to :municipality
  belongs_to_code :special_economic_zone

  validates :name, :coords, :municipality_id, :sez_type, :company, :contact_person, :contact_phone, :contact_email,
            :address, :free_square, :resident_privileges, :central_region_distance, :city_distance,
            :road_distance, :airport_distance, :seaport_distance, :presence => true

  validates :gas, :heating, :electricity, :water, :sewerage, :sewage_plants,
            :boiler_system, :boolean => true, :boolean => true

  translates :name, :sez_type, :company, :contact_person, :address, :residents, :authorized_activities, :protection_zones,
             :transport_driveways, :resident_privileges, :gas_details, :heating_details, :electricity_details,
             :water_details, :sewerage_details, :sewage_plants_details, :boiler_system_details

  has_many :pictures, as: :target, class_name: "GalleryPicture"
  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: proc { |r| r['file'].blank? }
  
  def export
    attributes = self.attributes.clone
    attributes.delete :sez_type
    attributes.merge({:pictures => self.pictures.map { |p| {
        :big => p.file_url(:big),
        :small => p.file_url(:small),
        :thumb => p.file_url(:thumb)
    } }})
  end
end