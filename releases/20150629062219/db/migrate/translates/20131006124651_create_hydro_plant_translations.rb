class CreateHydroPlantTranslations < ActiveRecord::Migration
  def change
    create_table :hydro_plant_translations do |t|
      t.integer  'hydro_plant_id'
      t.string   'locale'
      t.string   'name'
      t.text     'owner'
      t.text     'operating_organization'
      t.string   'generators_brand'
      t.datetime 'created_at',             :null => false
      t.datetime 'updated_at',             :null => false
    end

    add_index 'hydro_plant_translations', ['hydro_plant_id'], :name => 'index_hydro_plant_translations_on_hydro_plant_id'
    add_index 'hydro_plant_translations', ['locale'], :name => 'index_hydro_plant_translations_on_locale'
  end
end
