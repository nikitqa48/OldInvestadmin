class DevelopmentPlansController < Information::BaseController
  before_action :fill_development_plan_types, :only => [:new, :edit]
  private

  def fill_development_plan_types
    @development_plan_types = DevelopmentPlanType.all
  end

  def resource_params
    allowed = [:name, :coords, :owner_id, :description, :development_plan_type_code]
    super(allowed, pictures: true)
  end
end
