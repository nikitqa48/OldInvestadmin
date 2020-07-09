class CreateGeothermalElectricityPlantTranslations < ActiveRecord::Migration
  def change
    create_table :geothermal_electricity_plant_translations do |t|
      t.integer  'geothermal_electricity_plant_id'
      t.string   'locale'
      t.string   'name'
      t.text     'owner'
      t.text     'operating_organization'
      t.string   'generators_brand'
      t.datetime 'created_at',                      :null => false
      t.datetime 'updated_at',                      :null => false
    end

    add_index 'geothermal_electricity_plant_translations', ['geothermal_electricity_plant_id'], :name => 'index_fa484cc512ad39f68c8f32082e9fe63e0c820aaf'
    add_index 'geothermal_electricity_plant_translations', ['locale'], :name => 'index_geothermal_electricity_plant_translations_on_locale'
  end
end
