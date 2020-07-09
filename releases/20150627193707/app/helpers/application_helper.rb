module ApplicationHelper

  def locale_selector
    I18n.available_locales.map do |locale|
      link_to locale, "?locale=#{locale}", :class => I18n.locale == locale ? 'current' : nil
    end.join('<span>/</span>')
  end

  def button_fix
    content_tag(:span, nil)
  end

  def bool_select_array type = :word
    [true, false].map { |b|
      [bool_to_word(b, type), b]
    }
  end

  def bool_to_word bool, type = :word
    !bool.nil? ? I18n.t("helpers.bool_to.#{type}.if_#{bool}") : ""
  end

  def error_explanation target
    if target.errors.any?
      capture_haml do
        haml_tag 'ul.error-messages' do
          target.errors.full_messages.each do |msg|
            haml_tag 'li', msg
          end
        end
      end
    end
  end

  def map_field f, custom_coords = false
    capture_haml do
      haml_tag :div, class: 'form-group' do
        haml_tag :label, t('infrastructure.base.form.map') , class: 'control-label col-lg-3'
        haml_tag(:div, class: 'controls') do
          haml_concat f.hidden_field(:coords)
          haml_tag(:div, class: 'fix-leaflet'){ haml_tag(:div, id: 'map-container') }
          if custom_coords
            haml_tag :div, class: 'custom-coords' do
              haml_tag(:input, id: :coordX)
              haml_tag(:input, id: :coordY)
              haml_tag(:div, t('buttons.select'), id: :customCoordsUpdate, class: 'btn btn-default')
              haml_tag :p, t('helpers.hints.choose_custom_coords'), class: 'help-block'
            end
          end
        end
      end
    end
  end
end
