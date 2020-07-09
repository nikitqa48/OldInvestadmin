class Directory::NaturalResourceTypesController < Directory::BaseController
  protected

  def resource_params
    params.require(:natural_resource_type).permit(:name, :code, :map_format, :icon, :icon_cache, :remove_icon)
  end
end
