class Infrastructure::BaseController < InheritedResources::Base
  load_and_authorize_resource
  actions :all

  def show
    @attributes = params[:attributes] || %w(id name)
    respond_to do |format|
      format.pdf do
        file_name = File.join('pdf', "platform_#{resource.id}.pdf")
        html_content = render_to_body(_normalize_render :layout => 'pdf', :formats => 'html')
        absolute_file_path = File.join(Rails.root, 'public', file_name)
        Prince.new.html_to_file html_content, absolute_file_path
        redirect_to "/#{file_name}"
      end
      format.html do
        render
      end
    end
  end

  # White-listed attributes for the models which are inherited from the
  # <b>PowerPlantBase</b> abstract <b>model</b>.
  POWER_BASE_ALLOWED = [:name, :coords, :city_id, :owner, :operating_organization, :year_start, :installed_power,
                        :having_power, :generators_brand, :generators_power, :generators_release_year, :relevance, :owner_id]

  def collection
    resource ||= end_of_association_chain.accessible_by(current_ability).paginate(page: params[:page], per_page: 20)
  end

  private

  def resource_params(array, options={})
    pictures = options[:pictures]
    resource_name = resource_class.to_s.underscore.downcase
    params.require(resource_name).permit(array).tap do |whitelisted|
      if pictures.present? && params[resource_name][:pictures_attributes].present?
        whitelisted[:pictures_attributes] = params[resource_name][:pictures_attributes]
      end
    end
  end
end
