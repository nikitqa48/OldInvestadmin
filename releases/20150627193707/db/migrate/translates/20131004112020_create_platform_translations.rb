class CreatePlatformTranslations < ActiveRecord::Migration
  def change
    create_table :platform_translations do |t|
      t.integer :platform_id
      t.string :locale
      t.string :name
      t.text :type
      t.text :description
      t.text :legal_address
      t.text :contact_person
      t.text :address
      t.text :land_ownership_type
      t.text :company_text
      t.text :expandable
      t.text :nearby_facilities
      t.text :limitations
      t.text :expected_permitted_use
      t.text :government_agency_providing_land
      t.text :sanitary_protection_zones
      t.text :transportation_driveways
      t.text :buildings
      t.text :heating_details
      t.text :electricity_details
      t.text :water_details
      t.text :sewerage_details
      t.text :sewage_plants_details
      t.text :boiler_system_details
      t.text :service
      t.text :additional_information

      t.datetime 'created_at', :null => false
      t.datetime 'updated_at', :null => false
    end
    add_index :platform_translations, ['platform_id'], :name => 'index_632465fdc4cf9aaee498f48f0e2dbcd1c17ae04'
    add_index :platform_translations, ['locale'], :name => 'index_platform_translations_on_locale'
  end
end
