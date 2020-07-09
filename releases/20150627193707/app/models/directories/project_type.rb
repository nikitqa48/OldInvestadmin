class ProjectType < DirectoryBaseModel
  translates :name

  has_many :projects
end
