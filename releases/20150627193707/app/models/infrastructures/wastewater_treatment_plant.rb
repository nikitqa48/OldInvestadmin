# Очистные
class WastewaterTreatmentPlant < ActiveRecord::Base
  translates :name, :build_type, :address, :owner, :operating_organization

  default_scope order('id ASC')

  validates :name, :build_type, :address, :owner, :operating_organization, :year_start, :power, :conceded_wastewater,
            :relevance, presence: true

end