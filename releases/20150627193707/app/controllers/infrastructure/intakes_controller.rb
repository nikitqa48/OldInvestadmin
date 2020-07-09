class Infrastructure::IntakesController < Infrastructure::BaseController

  private

  def resource_params
    allowed = [:name, :coords, :intake_type, :address, :owner, :operating_organization, :year_start, :power,
               :water_supplied_to_net, :relevance, :owner_id]
    super(allowed)
  end
end
