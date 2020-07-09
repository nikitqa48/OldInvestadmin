class AddTypeCodeToSpecialEconomicZones < ActiveRecord::Migration
  def change
    add_column :special_economic_zones, :special_economic_zone_type_code, :string
  end
end
