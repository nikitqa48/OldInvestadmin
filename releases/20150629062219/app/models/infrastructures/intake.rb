# Водозаборные сооружения
class Intake < ActiveRecord::Base
  translates :name, :intake_type, :address, :owner, :operating_organization

  default_scope order('id ASC')

  validates :name, :intake_type, :address, :owner, :operating_organization, :year_start, :power, :water_supplied_to_net,
            :relevance, presence: true
end