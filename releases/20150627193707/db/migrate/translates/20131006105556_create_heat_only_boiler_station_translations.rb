class CreateHeatOnlyBoilerStationTranslations < ActiveRecord::Migration
  def change
    create_table :heat_only_boiler_station_translations do |t|
      t.integer  'heat_only_boiler_station_id'
      t.string   'locale'
      t.string   'name'
      t.text     'owner'
      t.text     'operating_organization'
      t.text     'fuel_type'
      t.text     'boiler_type'
      t.datetime 'created_at',                  :null => false
      t.datetime 'updated_at',                  :null => false
    end
    add_index 'heat_only_boiler_station_translations', ['heat_only_boiler_station_id'], :name => 'index_8c932b3b7f9e06930e8430b28f417337e97b489b'
    add_index 'heat_only_boiler_station_translations', ['locale'], :name => 'index_heat_only_boiler_station_translations_on_locale'
  end
end
