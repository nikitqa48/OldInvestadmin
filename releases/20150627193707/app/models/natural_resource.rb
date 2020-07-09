class NaturalResource < ActiveRecord::Base
  validates :coords, :natural_resource_type_code, :presence => true

  translates :description, :name, :content, :licence, :additional_information

  user_resource

  belongs_to_code :natural_resource_type

  default_scope order('id ASC')
end
