class Project < ActiveRecord::Base
  user_resource

  default_scope order('name ASC')


  belongs_to_code :economic_activity
  belongs_to :municipality
  belongs_to :project_type
  belongs_to :company
  has_many :pictures, as: :target, class_name: "GalleryPicture"
  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: proc { |r| r['file'].blank? }

  validates :name, :description, :territory, :coords, :territory_description,
            :readiness, :common_price, :own_investments, :required_investments,
            :project_type_id,  presence: true

  translates :name, :description,
             :territory_description,
             :availability_of_raw,
             :planned_production, :consumer_market_description, :readiness, :financial_evaluation,
             :key_performance_indicators, :social_significance, :investment_return_forms,
             :additional_info, :territory

  def export
    self.attributes.merge({:pictures => self.pictures.map { |p| {
        :big => p.file_url(:big),
        :small => p.file_url(:small),
        :medium => p.file_url(:medium),
        :thumb => p.file_url(:thumb)
    } }})
  end

end