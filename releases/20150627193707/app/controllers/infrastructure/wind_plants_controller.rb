class Infrastructure::WindPlantsController < Infrastructure::BaseController
  before_action :fill_variables

  private

  def fill_variables
    @cities = City.all
  end

  def resource_params
    super(Infrastructure::BaseController::POWER_BASE_ALLOWED)
  end
end
