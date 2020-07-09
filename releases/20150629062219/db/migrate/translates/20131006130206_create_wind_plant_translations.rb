class CreateWindPlantTranslations < ActiveRecord::Migration
  def change
    create_table :wind_plant_translations do |t|
      t.integer  'wind_plant_id'
      t.string   'locale'
      t.string   'name'
      t.text     'owner'
      t.text     'operating_organization'
      t.string   'generators_brand'
      t.datetime 'created_at',             :null => false
      t.datetime 'updated_at',             :null => false
    end

    add_index 'wind_plant_translations', ['locale'], :name => 'index_wind_plant_translations_on_locale'
    add_index 'wind_plant_translations', ['wind_plant_id'], :name => 'index_wind_plant_translations_on_wind_plant_id'
  end
end
