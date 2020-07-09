module PlatformsHelper
  def building_group field , obj = nil
    capture_haml do
      haml_tag :div, :class => "form-group" do
        haml_tag :label, t("activerecord.attributes.platform.building.#{field.to_s}"), :class => "control-label col-lg-3"
        haml_tag :div, :class => "controls" do
          haml_tag :input, " ", {:value => (obj[1][field.to_s] unless obj.blank?), :type => "text" , :data => {:name => field.to_s, :init => ("true" unless obj.blank? )},
                                 :name => ("platform[buildings][#{obj[0]}][#{field.to_s}]" unless obj.blank?),
                                :class => "form-control"}
        end
      end
    end
  end

  def platform_types_array
    Platform::TYPE.to_a.map{|b| [t("platforms.types.#{b[1]}"), b[0] ]}
  end
end
