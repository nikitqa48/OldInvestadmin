# сети водоснабжения

class WaterSupply < ActiveRecord::Base
  default_scope order('id ASC')

  translates :name, :description, :owner, :operating_organization

  validates :name, :coords, :description, :owner, :operating_organization, :year_start, :power, :relevance,
            presence: true

end