class Municipality < ActiveRecord::Base
  user_resource

  default_scope order('id ASC')

  translates :name, :description, :chief, :status, :based, :contacts

  has_many :platforms
  has_many :special_economic_zones
  has_many :industrial_parks
  has_many :pictures, as: :target, class_name: "GalleryPicture"
  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: proc { |r| r['file'].blank? }

  validates :name, :coords, presence: true

  def export
    self.attributes.merge({:pictures => self.pictures.map { |p| {
        :big => p.file_url(:big),
        :small => p.file_url(:small),
        :medium => p.file_url(:medium),
        :thumb => p.file_url(:thumb)
    } }})
  end

end