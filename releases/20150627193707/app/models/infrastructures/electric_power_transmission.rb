# Линии электропередач
class ElectricPowerTransmission < ActiveRecord::Base
  default_scope order('id ASC')

  translates :name, :description, :supplier, :owner, :operating_organization

  validates :name, :coords, :description, :supplier, :transmission_class, :city_from_id, :city_to_id, :number,
            :owner, :relevance, :operating_organization, presence: true
end