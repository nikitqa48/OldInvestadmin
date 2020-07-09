class Cluster < ActiveRecord::Base
  default_scope order('id ASC')

  belongs_to :municipality

  validates :name, :municipality_id, :company, :contact_person, :contact_phone, :contact_email,
            :address, :presence => true

  has_many :pictures, as: :target, class_name: "GalleryPicture"
  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: proc { |r| r['file'].blank? }

  translates :name, :description, :company, :contact_person, :address, :residents


  def export
    attributes = self.attributes.clone
    attributes.merge({:pictures => self.pictures.map { |p| {
        :big => p.file_url(:big),
        :small => p.file_url(:small),
        :thumb => p.file_url(:thumb)
    } }})
  end
end
