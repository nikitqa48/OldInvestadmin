class MunicipalitiesController < Information::BaseController
  before_filter :fill_variables

  private

  def fill_variables
    @companies = Company.all
  end

  def resource_params
    allowed = [:name, :description, :coords, :area, :density, :population, :chief, :status, :based, :pictures,
               :average_wage, :number_of_unemployed, :registered_unemployment,
               :contacts, :demo_mode, :owner_id, :distance_to_petropavlovsk_kamchatsky]
    super(allowed, pictures: true)
  end
end
