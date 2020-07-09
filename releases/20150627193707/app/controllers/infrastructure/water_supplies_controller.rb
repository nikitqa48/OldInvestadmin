class Infrastructure::WaterSuppliesController < Infrastructure::BaseController

  private

  def resource_params
    allowed = [:name, :coords, :description, :owner, :operating_organization,
               :year_start, :power, :relevance, :owner_id]
    super(allowed)
  end
end
