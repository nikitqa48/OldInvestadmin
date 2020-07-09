class Platform < ActiveRecord::Base
  user_resource

  default_scope order('id ASC')

  belongs_to_code :land_category
  belongs_to_code :ownership_type
  belongs_to :municipality
  belongs_to :company
  has_many :pictures, as: :target, class_name: "GalleryPicture"
  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: proc { |r| r['file'].blank? }

  validates :municipality_id, :coords, :name, :description, :owner_id, :land_category_code, :platform_type,
            :contact_person, :contact_person_email, :contact_person_phone, :address, :area,
            :limitations, :ownership_type_code, :permitted_uses,
            :government_agency_providing_land, presence: true

  validates :gas, :heating, :electricity, :water, :sewerage, :sewage_plants, :boiler_system, boolean: true

  serialize :buildings, Hash

  translates :name,
             :type,
             :description,
             :legal_address,
             :contact_person,
             :address,
             :expandable,
             :nearby_facilities,
             :limitations,
             :expected_permitted_use,
             :government_agency_providing_land,
             :sanitary_protection_zones,
             :transportation_driveways,
             :buildings,
             :heating_details,
             :electricity_details,
             :water_details,
             :sewerage_details,
             :sewage_plants_details,
             :boiler_system_details,
             :service,
             :additional_information,
             :company_text,
             :land_ownership_type

  def export
    self.attributes.merge({
                              :pictures => self.pictures.map { |p| {
                                  :big => p.file_url(:big),
                                  :small => p.file_url(:small),
                                  :thumb => p.file_url(:thumb)
                              } },

                              :buildings => self.buildings.try(:except, "_"),
                              :municipality_id => self.municipality.try(:name),
                              :land_category_code => self.land_category_code,
                          })
  end

end
