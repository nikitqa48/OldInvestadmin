class CompaniesController < Information::BaseController

  before_filter :fill_variables

  private

  def fill_variables
    # /!\ TODO find out what is this from the supervisor
    # there is no ane <b>@municipalities</b> in the view
    # @municipalities = Municipality.all
    @activity_spheres = ActivitySphere.all
  end

  def resource_params
    allowed = [:name, :coords, :description, :activity_sphere_code, :nomenclature, :demo_mode, :owner_id]
    super(allowed, pictures: true)
  end
end