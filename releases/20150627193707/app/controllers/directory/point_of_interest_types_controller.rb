class Directory::PointOfInterestTypesController < Directory::BaseController
  protected

  def resource_params
    params.require(:point_of_interest_type).permit(:name, :code, :icon, :icon_cache, :remove_icon)
  end
end