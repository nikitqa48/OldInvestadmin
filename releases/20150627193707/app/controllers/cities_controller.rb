class CitiesController < Information::BaseController

  private

  def resource_params
    allowed = [:name, :coords, :population, :area, :description, :based, :chief, :subdivisions, :site, :density, :economically_active_population, :demo_mode]
    super(allowed, pictures: true)
  end
end