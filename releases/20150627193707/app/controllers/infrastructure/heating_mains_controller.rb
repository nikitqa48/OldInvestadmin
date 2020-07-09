class Infrastructure::HeatingMainsController < Infrastructure::BaseController

  private

  def resource_params
    allowed = [:name, :coords, :description, :diameter, :length, :owner, :operating_organization, :relevance, :owner_id]
    super(allowed)
  end
end