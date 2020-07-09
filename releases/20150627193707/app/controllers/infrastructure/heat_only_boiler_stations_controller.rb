class Infrastructure::HeatOnlyBoilerStationsController < Infrastructure::BaseController

  private

  def resource_params
    allowed = [:name, :coords, :year_start, :owner, :operating_organization, :fuel_type, :boiler_type,
               :boiler_count, :boiler_year_start, :boiler_power, :connected_load, :boiler_performance,
               :heat_production_in_year, :relevance, :owner_id]
    super(allowed)
  end
end
