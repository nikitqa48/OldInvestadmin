class GasDistributionStation < ActiveRecord::Base

  default_scope order('id ASC')

  translates :name, :description, :owner, :operating_organization

  belongs_to :city

  # +=
  validates :name, :coords, :description, :municipality_id, :city_id, :out_1, :thousand_m3h_1, :million_m3y_1,
            :project_million_m3y_1, :actual_million_m3y_1, :loading_1, :out_2, :thousand_m3h_2, :million_m3y_2,
            :project_million_m3y_2, :actual_million_m3y_2, :loading_2, :owner, :relevance, :operating_organization,
            presence: true

end