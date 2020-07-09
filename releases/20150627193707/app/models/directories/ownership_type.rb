class OwnershipType < DirectoryBaseModel
  translates :name

  has_many :platforms
end
