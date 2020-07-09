# ТЭЦ

class CentralHeatingUnit < ActiveRecord::Base

  translates :name, :fuel_type, :equipment_type

  default_scope order('id ASC')

  validates :name, :coords, :year_start, :power, :fuel_type, :equipment_type, :boiler_count, :boiler_year_start,
            :boiler_power, :connected_load, :boiler_performance, :production_in_year, :relevance, presence: true
end
