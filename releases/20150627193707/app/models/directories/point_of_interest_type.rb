class PointOfInterestType < DirectoryBaseModel
  mount_uploader :icon, POITypeUploader

  translates :name

  has_many :point_of_interests


end