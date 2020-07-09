class CreateCentralHeatingUnits < ActiveRecord::Migration
  def change
    create_table :central_heating_units do |t|
      t.string   'name'
      t.text     'coords'
      t.string   'year_start'
      t.float    'power'
      t.text     'fuel_type'
      t.text     'equipment_type'
      t.integer  'boiler_count'
      t.string   'boiler_year_start'
      t.float    'boiler_power'
      t.float    'connected_load'
      t.float    'boiler_performance'
      t.float    'production_in_year'
      t.date     'relevance'
      t.integer  'owner_id'

      t.timestamps
    end
    add_index(:central_heating_units, :owner_id)
  end
end
