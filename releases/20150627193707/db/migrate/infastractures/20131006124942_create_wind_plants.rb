class CreateWindPlants < ActiveRecord::Migration
  def change
    create_table :wind_plants do |t|
      t.string   'name'
      t.text     'coords'
      t.integer  'city_id'
      t.text     'owner'
      t.text     'operating_organization'
      t.string   'year_start'
      t.float    'installed_power'
      t.float    'having_power'
      t.string   'generators_brand'
      t.float    'generators_power'
      t.string   'generators_release_year'
      t.date     'relevance'
      t.integer  'owner_id'
      t.timestamps
    end
    add_index(:wind_plants, :city_id)
    add_index(:wind_plants, :owner_id)
  end
end
