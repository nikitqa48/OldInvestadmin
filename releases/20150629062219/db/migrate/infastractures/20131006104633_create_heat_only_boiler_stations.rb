class CreateHeatOnlyBoilerStations < ActiveRecord::Migration
  def change
    create_table :heat_only_boiler_stations do |t|
      t.string   'name'
      t.text     'coords'
      t.string   'year_start'
      t.text     'owner'
      t.text     'operating_organization'
      t.text     'fuel_type'
      t.text     'boiler_type'
      t.integer  'boiler_count'
      t.string   'boiler_year_start'
      t.float    'boiler_power'
      t.float    'connected_load'
      t.float    'boiler_performance'
      t.float    'heat_production_in_year'
      t.date     'relevance'
      t.integer  'owner_id'
      #
      t.timestamps
    end
    add_index(:heat_only_boiler_stations, :owner_id)
  end
end
