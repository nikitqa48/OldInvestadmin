class CreateSpecialEconomicZoneTypes < ActiveRecord::Migration
  def change
    create_table :special_economic_zone_types do |t|
      t.string :name
      t.string :code
      t.timestamps
    end
  end
end
