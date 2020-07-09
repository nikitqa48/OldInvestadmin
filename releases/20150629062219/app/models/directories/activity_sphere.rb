class ActivitySphere < DirectoryBaseModel
  translates :name

  has_many :companies
end