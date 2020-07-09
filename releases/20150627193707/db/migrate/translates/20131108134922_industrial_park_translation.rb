class IndustrialParkTranslation < ActiveRecord::Migration
  def change
    create_table "industrial_park_translations", force: true do |t|
      t.integer  "industrial_park_id"
      t.string   "locale"
      t.string   "name"
      t.string   "park_type"
      t.text     "description"
      t.string   "company"
      t.text     "legal_address"
      t.string   "contact_person"
      t.string   "contact_phone"
      t.string   "contact_email"
      t.text     "address"
      t.text     "residents"
      t.text     "authorized_activities"
      t.text     "protection_zones"
      t.text     "transport_driveways"
      t.text     "services"
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
