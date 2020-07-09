class CreateDieselPowerPlantTranslations < ActiveRecord::Migration
  def change
    create_table :diesel_power_plant_translations do |t|
      t.integer  'diesel_power_plant_id'
      t.string   'locale'
      t.string   'name'
      t.text     'owner'
      t.text     'operating_organization'
      t.string   'generators_brand'
      t.datetime 'created_at',             :null => false
      t.datetime 'updated_at',             :null => false
    end
    add_index 'diesel_power_plant_translations', ['diesel_power_plant_id'], :name => 'index_diesel_power_plant_translations_on_diesel_power_plant_id'
    add_index 'diesel_power_plant_translations', ['locale'], :name => 'index_diesel_power_plant_translations_on_locale'
  end
end
