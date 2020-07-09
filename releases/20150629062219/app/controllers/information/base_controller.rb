class Information::BaseController < InheritedResources::Base
  skip_authorize_for_pdf
  actions :all, except: [:show]

  def update
    update!(notice: t('messages.record_updated')) { route(:index) }
  end

  def create
    create!(notice: t('messages.record_created')) { route(:index) }
  end

  def destroy
    destroy! { route(:index) }
  end

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

  protected

  def route(action=nil, object=nil)
    url_for(controller: controller_name, action: action, id: object)
  end

  helper_method :route

  def collection
    resource ||= end_of_association_chain.accessible_by(current_ability).paginate(page: params[:page], per_page: 20)
  end

  private

  # Redefine this method in the inherited class.
  # F.e.
  #
  #   def resource_params
  #     allowed = [:name, :coords, :description, :owner_id]
  #     super(allowed, pictures: true)
  #   end
  #
  # Arguments:
  #   ** array - array with <b>whitelisted</b> attributes;
  #   ** {pictures: true} - allow <b>picture</b> params in the case of nested form;
  #
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