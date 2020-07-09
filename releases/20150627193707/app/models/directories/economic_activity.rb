class EconomicActivity < DirectoryBaseModel
  translates :name

  has_many :projects

  def to_s
    "#{code} - #{name}"
  end
end
