class GalleryPicture < ActiveRecord::Base
  self.table_name = "pictures"
  mount_uploader :file, PictureFileUploader

  default_scope order('id ASC')

  belongs_to :target, polymorphic: true
end