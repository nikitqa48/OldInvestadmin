class GasPipeline < ActiveRecord::Base

  default_scope order('id ASC')

  translates :name, :description, :owner, :operating_organization

  validates :name, :coords, :description, :number, :diameter, :length, :owner, :relevance, :operating_organization,
            presence: true

end