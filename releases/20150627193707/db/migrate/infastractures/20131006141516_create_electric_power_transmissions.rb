class CreateElectricPowerTransmissions < ActiveRecord::Migration
  def change
    create_table :electric_power_transmissions do |t|
      t.string   'name'
      t.text     'coords'
      t.text     'description'
      t.text     'supplier'
      t.integer  'transmission_class'
      t.integer  'city_from_id'
      t.integer  'city_to_id'
      t.string   'number'
      t.text     'owner'
      t.text     'operating_organization'
      t.date     'relevance'
      t.integer  'owner_id'

      t.timestamps
    end
    add_index(:electric_power_transmissions, :city_from_id)
    add_index(:electric_power_transmissions, :city_to_id)
    add_index(:electric_power_transmissions, :owner_id)
  end
end
