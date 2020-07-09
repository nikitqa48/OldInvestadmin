module SkipAuthorizeForPdf
  def self.included base
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def skip_authorize_for_pdf
      include SkipAuthorizeForPdf::InstanceMethods
    end
  end

  module InstanceMethods
    def authenticate_user!
      super if !(action_name == "show"  && params[:format] == "pdf")
    end
  end
end