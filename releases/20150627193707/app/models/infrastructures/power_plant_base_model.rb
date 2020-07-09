class PowerPlantBaseModel < ActiveRecord::Base
  self.abstract_class = true # disable single table inheritance

  default_scope order('id ASC')

  # Common attributes which have to be Globolized from the nested model
  TRANSLATES = [:name, :owner, :operating_organization, :generators_brand]

  alias_attribute :to_s, :name

  belongs_to :city

  validates :name, :coords, :city_id, :owner, :operating_organization, :year_start, :installed_power, :having_power,
            :generators_brand, :generators_power, :generators_release_year, :relevance, presence: true

end