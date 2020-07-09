class ClustersController < Information::BaseController
  before_filter :fill_variables

  private

  def fill_variables
    @municipalities = Municipality.accessible_by(current_ability)
  end

  def resource_params
    allowed = [:name, :coords, :description, :municipality_id, :company, :contact_person, :contact_phone,
               :contact_email, :address, :free_square, :residents, :demo_mode]
    super(allowed, pictures: true)
  end
end
