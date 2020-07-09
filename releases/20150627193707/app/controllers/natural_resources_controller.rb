class NaturalResourcesController < Information::BaseController

  before_filter :fill_variables
  before_filter :fill_error_explanation, :only => [:update, :create]


  private

  def fill_error_explanation
    @error_explanation = !(params['error_explanation'] == 'false')
  end

  def fill_variables
    @natural_resource_types = NaturalResourceType.all
  end

  def resource_params
    allowed = [:name,:content, :natural_resource_type_code, :owner_id,  :coords, :reserve,  :licence, :additional_information, :description ]
    super(allowed)
  end
end
