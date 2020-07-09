class Picture < ActiveRecord::Base
  mount_uploader :file, PictureFileUploader

  default_scope order('id ASC')

  belongs_to :target, polymorphic: true
end