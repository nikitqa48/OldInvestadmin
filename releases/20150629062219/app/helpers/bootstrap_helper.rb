module BootstrapHelper

  # Use options <b>hint</b> with custom text or a true class:
  #
  #    = form_group f, hint: true
  #
  # In this way method will produce the hint by accessing an i18n key:
  # +activerecord.attributes.model_name._hint.attribute_name+
  #
  def form_group f, field_name, input_type = nil, *options, &block
    opts = options.last.is_a?(Hash) ? options.last : {}

    hint = opts.delete(:hint)
    hint = hint.is_a?(TrueClass) ? t("activerecord.attributes.#{f.object.class.model_name.i18n_key}._hint.#{field_name}") : hint

    label = opts.delete(:label)
    parent_options = opts.delete(:parent) || {}
    label_field_name = [field_name].flatten.first
    input_field_name = [field_name].flatten.last
    form_tag_helper = Object.new.extend(ActionView::Helpers::FormTagHelper).extend(ActionView::Helpers::TagHelper)
    parent_options[:class] = "#{parent_options[:class]} form-group"
    content_tag :div, parent_options do
      raw([
              (
              label ? content_tag(:label, :class => 'control-label col-lg-3') do
                label
              end : f.label(label_field_name, :class => 'control-label col-lg-3')
              ),

              if block_given?
                content_tag :div, :class => 'controls', &block
              else
                content_tag(:div, :class => 'controls') do
                  field = if f.respond_to?(input_type)

                            options.map do |el|
                              if el.is_a?(Hash)
                                if el[:class]
                                  el[:class].is_a?(Array) ? el[:class] << 'form-control' : el[:class] += ' form-control'
                                else
                                  el[:class] = 'form-control'
                                end
                              end
                              el
                            end
                            options << {:class => 'form-control'} if options.blank?

                            f.send(input_type, input_field_name, *options)
                          else
                            form_tag_helper.send(input_type, input_field_name, *options)
                          end
                  raw([
                          field,
                          hint && form_tag_helper.content_tag(:p, hint, :class => "help-block", "data-help-for" => input_field_name)
                      ].join(' '))
                end
              end,
          ].join(' '))
    end
  end

  def data_row object, attribute_name, &block
    i18n_text = object.class.human_attribute_name(attribute_name)

    capture_haml do
      haml_tag 'tr' do
        haml_tag 'td.static3', i18n_text
        if block_given?
          haml_tag 'td.strong', yield
        else
          value = object.send(attribute_name.to_sym)

          value = '+' if value.is_a? TrueClass
          value = '-' if value.is_a? FalseClass

          haml_tag 'td.strong', value
        end
      end
    end
  end

  def form_group_select f, name, directories
    form_group f, name, :select,
               options_from_collection_for_select(directories, :code, :name, selected: f.object.send(name)),
               {include_blank: true}, {class: 'simple-chosen', "data-placeholder" => t("helpers.placeholder.default")}
  end


  def form_check_box f, name
    capture_haml do
      haml_tag :div, class: 'form-group' do
        haml_tag :div, class: 'controls' do
          haml_tag :label, class: 'checkbox' do
            haml_concat f.check_box(name)
            haml_concat f.object.class.human_attribute_name(name)
          end
        end
      end
    end
  end

  def submit_btn f
    f.submit  t(f.object.new_record? ? 'buttons.create': 'buttons.save'), class: 'btn btn-primary btn-with-tooltip',
              'data-original-title' => t('messages.tooltips.save'), 'data-placement' => 'bottom'
  end

  def cancel_btn f, cancel_path = :index
    link_to t('buttons.cancel'), url_for(action: cancel_path), class: 'btn btn-default'
  end

  def icon_upload_group f, field_name, *options
    opts = options.last.is_a?(Hash) ? options.last : {}
    class_uploader = opts.delete(:class)
    form_group f, field_name, :image_tag do
      haml_tag :div, :class => "picture-uploader #{class_uploader}" do
        url = f.object.send(field_name.to_s).to_s
        picture = IconUploader::PICTURE_EXTENTIONS.include?(File.extname(url).downcase)
        haml_concat picture ? link_to(image_tag(f.object.send(field_name.to_s + "_url"), :class => "pull-left"), url, :class => "fancybox") : link_to(File.basename(url), url) if f.object.send(field_name.to_s + "_url")
        haml_tag "div.clear"
        haml_concat f.file_field field_name.to_sym, :class => "file-uploader"
        haml_concat f.hidden_field (field_name.to_s + "_cache").to_sym
        haml_concat f.check_box ("remove_" + field_name.to_s).to_sym, :class => "remove-picture"
        haml_tag :span, t("buttons.delete")
      end
    end
  end
end