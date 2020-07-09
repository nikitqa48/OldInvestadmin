class CreateDuelFuelPowerPlantTranslations < ActiveRecord::Migration
  def change
    create_table :duel_fuel_power_plant_translations do |t|
      t.integer  'duel_fuel_power_plant_id'
      t.string   'locale'
      t.string   'name'
      t.text     'owner'
      t.text     'operating_organization'
      t.string   'generators_brand'
      t.datetime 'created_at',               :null => false
      t.datetime 'updated_at',               :null => false
    end

    add_index 'duel_fuel_power_plant_translations', ['duel_fuel_power_plant_id'], :name => 'index_a6af833bf38c3e8a10e261ece4a135a9e34a6a3c'
    add_index 'duel_fuel_power_plant_translations', ['locale'], :name => 'index_duel_fuel_power_plant_translations_on_locale'
  end
end
