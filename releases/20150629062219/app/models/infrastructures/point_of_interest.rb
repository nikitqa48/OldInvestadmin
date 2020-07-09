class PointOfInterest < ActiveRecord::Base
  translates :name, :description

  has_many :pictures, as: :target, class_name: "GalleryPicture"
  belongs_to_code :point_of_interest_type
  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: proc { |r| r['file'].blank? }

  default_scope order('id ASC')

  validates :name, :point_of_interest_type_code, :coords, :presence => true

  def export
    self.attributes.merge({
        :logo => point_of_interest_type.icon_url,
        :pictures => self.pictures.map { |p| {
          :big => p.file_url(:big),
          :small => p.file_url(:small),
          :thumb => p.file_url(:thumb)
    } }})
  end
end