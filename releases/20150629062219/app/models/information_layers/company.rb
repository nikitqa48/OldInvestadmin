class Company < ActiveRecord::Base
  user_resource
  translates :name, :description

  default_scope order('id ASC')

  belongs_to_code :activity_sphere
  has_many :pictures, as: :target, class_name: "GalleryPicture"
  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: proc { |r| r['file'].blank? }
  has_many :projects
  has_many :platforms

  validates :name,  presence: true#, #:coords,

  def export
    self.attributes.merge({:pictures => self.pictures.map { |p| {
        :big => p.file_url(:big),
        :small => p.file_url(:small),
        :medium => p.file_url(:medium),
        :thumb => p.file_url(:thumb)
    } }})
  end
end