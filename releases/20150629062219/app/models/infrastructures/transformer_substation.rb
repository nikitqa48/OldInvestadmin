class TransformerSubstation < ActiveRecord::Base

  default_scope order('id ASC')

  translates :name, :description, :owner, :category, :district, :address, :operating_organization

  validates :name, :coords, :description, :number, :owner, :category, :district, :address, :relevance,
            :operating_organization, presence: true

end