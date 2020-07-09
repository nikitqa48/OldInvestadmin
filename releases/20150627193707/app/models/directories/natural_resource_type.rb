class NaturalResourceType < DirectoryBaseModel
  MAP_FORMAT = { 1 => :point, 2 => :line ,3 => :area }

  mount_uploader :icon, IconUploader

  translates :name

  default_scope order('id ASC')

  def map_format_sym
    MAP_FORMAT[map_format]
  end

  def export
    self.attributes.merge({:icon => self.icon_url})
  end
end
