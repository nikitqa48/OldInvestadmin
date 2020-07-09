class SpecEcZoneTranslations < ActiveRecord::Migration
  def change
    create_table "special_economic_zone_translations", force: true do |t|
      t.integer  "special_economic_zone_id"
      t.string   "locale"
      t.string   "name"
      t.string   "sez_type"
      t.string   "company"
      t.string   "contact_person"
      t.text     "address"
      t.text     "residents"
      t.text     "authorized_activities"
      t.text     "protection_zones"
      t.text     "transport_driveways"
      t.text     "resident_privileges"
      t.string   "gas_details"
      t.string   "heating_details"
      t.string   "electricity_details"
      t.string   "water_details"
      t.string   "sewerage_details"
      t.string   "sewage_plants_details"
      t.string   "boiler_system_details"
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
    end
  end
end
