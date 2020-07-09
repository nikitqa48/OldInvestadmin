class DevelopmentPlan < ActiveRecord::Base
  user_resource
  default_scope order('id ASC')
  belongs_to_code :development_plan_type
  translates :name, :description
  validates :name, :description, :coords, presence: true

end
