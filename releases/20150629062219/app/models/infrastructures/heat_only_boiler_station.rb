# Котельня

class HeatOnlyBoilerStation < ActiveRecord::Base

  translates :name, :owner, :operating_organization, :fuel_type, :boiler_type

  default_scope order('id ASC')

  validates :name, :coords, :year_start, :owner, :operating_organization, :fuel_type, :boiler_type, :boiler_count,
            :boiler_year_start, :boiler_power, :connected_load, :boiler_performance, :heat_production_in_year,
            :relevance, presence: true
end