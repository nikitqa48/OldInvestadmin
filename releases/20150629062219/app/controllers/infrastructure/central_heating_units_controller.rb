class Infrastructure::CentralHeatingUnitsController < Infrastructure::BaseController

  private

  def resource_params
    allowed = [:name, :coords, :year_start, :power, :fuel_type, :equipment_type, :boiler_count, :boiler_year_start,
               :boiler_power, :connected_load, :boiler_performance, :production_in_year, :relevance, :owner_id]
    super(allowed)
  end
end
