class SpecialEconomicZoneTypeTranslations < ActiveRecord::Migration
  def up
    SpecialEconomicZoneType.create_translation_table! :name  => :string
  end

  def down
    SpecialEconomicZoneType.drop_translation_table!
  end
end
