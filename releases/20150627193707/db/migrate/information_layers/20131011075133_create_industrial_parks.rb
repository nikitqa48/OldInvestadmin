class CreateIndustrialParks < ActiveRecord::Migration
  def change
    create_table :industrial_parks do |t|
      t.integer :municipality_id
      t.string :name
      t.string :park_type
      t.text :description
      t.text :coords

      t.string :company
      t.text :legal_address
      t.string :contact_person
      t.string :contact_phone
      t.string :contact_email
      t.text :address
      t.float :free_square
      t.text :residents
      t.float :nearest_houses_distance
      t.text :authorized_activities
      t.text :protection_zones
      t.text :transport_driveways
      t.text :services

      t.float :central_region_distance
      t.float :another_region_distance
      t.float :city_distance
      t.float :road_distance
      t.float :airport_distance
      t.float :seaport_distance

      t.boolean :gas
      t.string  :gas_details
      t.boolean :heating
      t.string  :heating_details
      t.boolean :electricity
      t.string  :electricity_details
      t.boolean :water
      t.string  :water_details
      t.boolean :sewerage
      t.string  :sewerage_details
      t.boolean :sewage_plants
      t.string  :sewage_plants_details
      t.boolean :boiler_system
      t.string  :boiler_system_details

      t.boolean :demo_mode

      t.timestamps
    end
    add_index(:industrial_parks, :municipality_id)

  end
end
