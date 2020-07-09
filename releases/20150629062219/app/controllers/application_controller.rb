class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied, :with => :render_error

  protected

  def render_error exception
    Rails.logger.error [exception.message, exception.backtrace].flatten.join("\n")
    name = exception.class.name.underscore.split("/").join(".")
    status, non_xhr_scene, xhr_scene = case exception.class.to_s
                                         when CanCan::AccessDenied.to_s
                                           [403, render: "/application/access_denied"]
                                         else
                                           500
                                       end
    non_xhr_scene ||= :text
    xhr_scene ||= non_xhr_scene
    #layout = !request.xhr? && "admin"
    scene = request.xhr? ? xhr_scene : non_xhr_scene
    method = [*scene].flatten[0].to_sym || :render
    url = [*scene].flatten[1] || "/application/error"

    case method
      when :text
        render :text => t("errors.#{name}"), :status => status
      when :render
        render :template => url,
               :locals => {:name => name},
               #:layout => layout,
               :status => status
      when :redirect
        redirect_to url
    end
  end

  def set_locale
    if params[:locale]
      I18n.locale = session[:language] = params[:locale]
      redirect_to request.env['HTTP_REFERER'] if request.env['HTTP_REFERER']
    else
      I18n.locale = session[:language]
    end
  end
end