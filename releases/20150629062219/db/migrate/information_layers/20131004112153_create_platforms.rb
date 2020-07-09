class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.integer  :code
      t.integer  :municipality_id
      t.text     :coords
      t.string   :name
      t.string   :key
      t.text     :type
      t.text     :description
      t.integer  :company_id
      t.integer  :owner_id
      t.text     :legal_address
      t.text     :contact_person
      t.text     :contact_person_email
      t.text     :contact_person_phone
      t.text     :address
      t.float    :area
      t.text     :land_ownership_type #Вид права владения землей
      t.text     :expandable #Возможность расширения
      t.text     :nearby_facilities #Близлежащие производственные объекты
      t.float    :nearest_houses_distance #Расстояние до ближайших жилых домов
      t.text     :limitations # Ограничения
      t.integer  :land_category_code
      t.text     :expected_permitted_use #Предполагаемое разрешенное использование
      t.text     :government_agency_providing_land #Орган, осуществляющий предоставление земельного участка
      t.text     :cadastral_number
      t.text     :sanitary_protection_zones #Наличие санитарно-защитных/охранных зон
      t.text     :transportation_driveways #Наличие транспортных подъездных путей
      t.text     :platform_type

      t.float    :region_distance # удаленность от центра субъекта Российской Федерации, в котором находится площадка
      t.float    :city_distance
      t.float    :road_distance
      t.float    :airport_distance
      t.float    :seaport_distance

      t.boolean  :gas
      t.string   :gas_details
      t.boolean  :heating
      t.string   :heating_details
      t.boolean  :electricity
      t.string   :electricity_details
      t.boolean  :water
      t.string   :water_details
      t.boolean  :sewerage
      t.string   :sewerage_details
      t.boolean  :sewage_plants
      t.string   :sewage_plants_details
      t.boolean  :boiler_system
      t.string   :boiler_system_details

      t.integer  :ownership_type_code
      t.text     :company_text
      t.boolean  :demo_mode

      t.text     :buildings
      #
      t.timestamps
    end
    add_index(:platforms, :municipality_id)
    add_index(:platforms, :company_id)
    add_index(:platforms, :owner_id)
  end
end
