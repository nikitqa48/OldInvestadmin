# Коллектор (линия канализации)
class Sewer < ActiveRecord::Base
  translates :name, :description, :owner, :operating_organization

  default_scope order('id ASC')

  validates :name, :description, :owner, :operating_organization, :year_start, :power, :relevance, presence: true
end