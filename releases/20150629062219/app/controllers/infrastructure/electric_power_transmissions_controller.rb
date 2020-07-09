class Infrastructure::ElectricPowerTransmissionsController < Infrastructure::BaseController
  before_action :fill_variables

  private

  def fill_variables
    @cities = City.accessible_by(current_ability)
  end

  def resource_params
    allowed = [:name, :coords, :description, :supplier, :transmission_class, :city_from_id, :city_to_id, :number,
               :owner, :relevance, :operating_organization, :owner_id]
    super(allowed)
  end
end