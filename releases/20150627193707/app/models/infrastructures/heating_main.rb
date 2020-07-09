# Теплотрасса

class HeatingMain < ActiveRecord::Base

  default_scope order('id ASC')

  translates :name, :description, :owner, :operating_organization

  validates :name, :description, :diameter, :length, :owner, :operating_organization, :relevance, presence: true
end