class City < ActiveRecord::Base
  translates :name, :description

  default_scope order('id ASC')

  has_many :gas_distribution_station
  has_many :pictures, as: :target, class_name: "GalleryPicture"
  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: proc { |r| r['file'].blank? }

  validates :name, :coords, presence: true

  def export
    self.attributes.merge({:pictures => self.pictures.map { |p| {
        :big => p.file_url(:big),
        :small => p.file_url(:small),
        :thumb => p.file_url(:thumb)
    } }})
  end

end