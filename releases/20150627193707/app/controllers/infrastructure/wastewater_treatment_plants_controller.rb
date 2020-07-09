class Infrastructure::WastewaterTreatmentPlantsController < Infrastructure::BaseController

  private

  def resource_params
    allowed = [:name, :coords, :build_type, :address, :owner, :operating_organization, :year_start, :power,
               :conceded_wastewater, :relevance, :owner_id]
    super(allowed)
  end
end
