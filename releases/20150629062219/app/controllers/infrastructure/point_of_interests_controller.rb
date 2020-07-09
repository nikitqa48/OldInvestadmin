class Infrastructure::PointOfInterestsController < Infrastructure::BaseController
  before_action :fill_variables

  private

  def fill_variables
    @point_of_interest_types = PointOfInterestType.accessible_by current_ability
  end


  def resource_params
    allowed = [:name, :coords, :description, :point_of_interest_type_code, :owner_id]
    super(allowed, pictures: true)
  end
end