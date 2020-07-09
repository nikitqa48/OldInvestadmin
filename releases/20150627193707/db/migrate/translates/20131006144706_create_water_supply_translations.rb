class CreateWaterSupplyTranslations < ActiveRecord::Migration
  def change
    create_table :water_supply_translations do |t|
      t.integer  'water_supply_id'
      t.string   'locale'
      t.string   'name'
      t.text     'description'
      t.text     'owner'
      t.text     'operating_organization'
      t.datetime 'created_at',             :null => false
      t.datetime 'updated_at',             :null => false
    end

    add_index 'water_supply_translations', ['locale'], :name => 'index_water_supply_translations_on_locale'
    add_index 'water_supply_translations', ['water_supply_id'], :name => 'index_water_supply_translations_on_water_supply_id'
  end
end
