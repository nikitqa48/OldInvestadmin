class CreateWastewaterTreatmentPlantTranslations < ActiveRecord::Migration
  def change
    create_table :wastewater_treatment_plant_translations do |t|
      t.integer  'wastewater_treatment_plant_id'
      t.string   'locale'
      t.string   'name'
      t.text     'build_type'
      t.text     'address'
      t.text     'owner'
      t.text     'operating_organization'
      t.datetime 'created_at',                    :null => false
      t.datetime 'updated_at',                    :null => false
    end

    add_index 'wastewater_treatment_plant_translations', ['locale'], :name => 'index_wastewater_treatment_plant_translations_on_locale'
    add_index 'wastewater_treatment_plant_translations', ['wastewater_treatment_plant_id'], :name => 'index_ec05eaf4537e1709c4a9a7662980e2338a357f23'
  end
end