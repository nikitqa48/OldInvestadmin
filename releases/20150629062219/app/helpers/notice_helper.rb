module NoticeHelper
  def render_notice
    capture_haml do
      if flash[:notice]
        haml_tag :div, class: 'alert alert-success' do
          haml_concat flash[:notice]
        end
      end

      if flash[:alert]
        haml_tag :div, class: 'alert alert-danger' do
          haml_concat flash[:alert]
        end
      end

      if flash[:error]
        haml_tag :div, class: 'alert alert-danger' do
          haml_concat flash[:error]
        end
      end

      if flash[:warning]
        haml_tag :div, class: 'alert alert-warning' do
          haml_concat flash[:warning]
        end
      end
    end
  end
end