class Infrastructure::GasPipelinesController < Infrastructure::BaseController

  private

  def resource_params
    allowed = [:name, :coords, :description, :number, :diameter, :length, :owner, :relevance, :operating_organization, :owner_id]
    super(allowed)
  end
end