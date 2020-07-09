class Directory::BaseController < InheritedResources::Base
  load_and_authorize_resource
  actions :all, except: :show
  protected
  def collection
    resource ||= end_of_association_chain.accessible_by(current_ability).paginate(page: params[:page], per_page: 20)
  end

  def resource_params
    params.require(controller_name.singularize).permit(:name, :code)
  end
end
