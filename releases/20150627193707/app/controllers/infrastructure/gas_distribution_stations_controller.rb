class Infrastructure::GasDistributionStationsController < Infrastructure::BaseController
  before_action :fill_variables

  private

  def fill_variables
    @municipalities = Municipality.accessible_by(current_ability)
    @cities = City.accessible_by(current_ability)
  end

  def resource_params
    allowed = [:name, :coords, :description, :municipality_id, :city_id, :out_1, :thousand_m3h_1, :million_m3y_1,
               :project_million_m3y_1, :actual_million_m3y_1, :loading_1, :out_2, :thousand_m3h_2, :million_m3y_2,
               :project_million_m3y_2, :actual_million_m3y_2, :loading_2, :owner, :relevance, :operating_organization, :owner_id]
    super(allowed)
  end
end