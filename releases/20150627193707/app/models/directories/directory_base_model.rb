class DirectoryBaseModel < ActiveRecord::Base
  self.abstract_class = true # disable single table inheritance

  default_scope order('code ASC')

  alias_attribute :to_s, :name

  validates :code, :name, presence: true
  validates :code, uniqueness: true
end