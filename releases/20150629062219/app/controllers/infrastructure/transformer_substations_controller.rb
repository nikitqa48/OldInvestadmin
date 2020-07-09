class Infrastructure::TransformerSubstationsController < Infrastructure::BaseController

  private

  def resource_params
    allowed = [:name, :coords, :description, :number, :owner, :category, :district, :address, :relevance,
               :operating_organization, :owner_id]
    super(allowed)
  end
end