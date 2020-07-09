class LandCategory < DirectoryBaseModel
  translates :name

  has_many :platforms
end