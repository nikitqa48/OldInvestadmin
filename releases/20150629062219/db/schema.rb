# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131209103500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_sphere_translations", force: true do |t|
    t.integer  "activity_sphere_id"
    t.string   "locale"
    t.text     "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "activity_sphere_translations", ["activity_sphere_id"], name: "index_832465fdc4cf8b919e498f48f0e2dbcd1c17ae04", using: :btree
  add_index "activity_sphere_translations", ["locale"], name: "index_activity_sphere_translations_on_locale", using: :btree

  create_table "activity_spheres", force: true do |t|
    t.string   "name"
    t.integer  "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "central_heating_unit_translations", force: true do |t|
    t.integer  "central_heating_unit_id"
    t.string   "locale"
    t.string   "name"
    t.text     "fuel_type"
    t.text     "equipment_type"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "central_heating_unit_translations", ["central_heating_unit_id"], name: "index_53f8b2a053f0e6325af9edfc5e5ba1a0db9cf3f5", using: :btree
  add_index "central_heating_unit_translations", ["locale"], name: "index_central_heating_unit_translations_on_locale", using: :btree

  create_table "central_heating_units", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.string   "year_start"
    t.float    "power"
    t.text     "fuel_type"
    t.text     "equipment_type"
    t.integer  "boiler_count"
    t.string   "boiler_year_start"
    t.float    "boiler_power"
    t.float    "connected_load"
    t.float    "boiler_performance"
    t.float    "production_in_year"
    t.date     "relevance"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "central_heating_units", ["owner_id"], name: "index_central_heating_units_on_owner_id", using: :btree

  create_table "cities", force: true do |t|
    t.string   "name"
    t.string   "coords"
    t.integer  "code"
    t.text     "description"
    t.text     "area"
    t.string   "population"
    t.string   "based"
    t.string   "chief"
    t.string   "site"
    t.string   "density"
    t.string   "subdivisions"
    t.string   "economically_active_population"
    t.boolean  "demo_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "city_translations", force: true do |t|
    t.integer  "city_id"
    t.string   "locale"
    t.text     "name"
    t.text     "description"
    t.string   "based"
    t.string   "chief"
    t.string   "site"
    t.string   "density"
    t.string   "subdivisions"
    t.string   "economically_active_population"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "city_translations", ["city_id"], name: "index_city_translations_on_city_id", using: :btree
  add_index "city_translations", ["locale"], name: "index_city_translations_on_locale", using: :btree

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "cluster_translations", force: true do |t|
    t.integer  "cluster_id",     null: false
    t.string   "locale",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.string   "company"
    t.string   "contact_person"
    t.text     "address"
    t.text     "residents"
  end

  add_index "cluster_translations", ["cluster_id"], name: "index_cluster_translations_on_cluster_id", using: :btree
  add_index "cluster_translations", ["locale"], name: "index_cluster_translations_on_locale", using: :btree

  create_table "clusters", force: true do |t|
    t.string   "name"
    t.integer  "municipality_id"
    t.text     "coords"
    t.text     "description"
    t.string   "company"
    t.string   "contact_person"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.text     "address"
    t.float    "free_square"
    t.text     "residents"
    t.boolean  "demo_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "coords"
    t.integer  "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_sphere_code"
    t.text     "nomenclature"
    t.boolean  "demo_mode"
    t.integer  "owner_id"
  end

  add_index "companies", ["owner_id"], name: "index_companies_on_owner_id", using: :btree

  create_table "company_translations", force: true do |t|
    t.integer  "company_id"
    t.string   "locale"
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "company_translations", ["company_id"], name: "index_company_translations_on_company_id", using: :btree
  add_index "company_translations", ["locale"], name: "index_company_translations_on_locale", using: :btree

  create_table "development_plan_translations", force: true do |t|
    t.integer  "development_plan_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "development_plan_type_translations", force: true do |t|
    t.integer  "development_plan_type_id", null: false
    t.string   "locale",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "development_plan_type_translations", ["development_plan_type_id"], name: "index_42c8e74ed674c0bce3483f53cc7832be9654cbbb", using: :btree
  add_index "development_plan_type_translations", ["locale"], name: "index_development_plan_type_translations_on_locale", using: :btree

  create_table "development_plan_types", force: true do |t|
    t.string   "name"
    t.integer  "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "development_plans", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "coords"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "development_plan_type_code"
  end

  create_table "diesel_power_plant_translations", force: true do |t|
    t.integer  "diesel_power_plant_id"
    t.string   "locale"
    t.string   "name"
    t.text     "owner"
    t.text     "operating_organization"
    t.string   "generators_brand"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "diesel_power_plant_translations", ["diesel_power_plant_id"], name: "index_diesel_power_plant_translations_on_diesel_power_plant_id", using: :btree
  add_index "diesel_power_plant_translations", ["locale"], name: "index_diesel_power_plant_translations_on_locale", using: :btree

  create_table "diesel_power_plants", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.integer  "city_id"
    t.text     "owner"
    t.text     "operating_organization"
    t.string   "year_start"
    t.float    "installed_power"
    t.float    "having_power"
    t.string   "generators_brand"
    t.float    "generators_power"
    t.string   "generators_release_year"
    t.date     "relevance"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diesel_power_plants", ["city_id"], name: "index_diesel_power_plants_on_city_id", using: :btree
  add_index "diesel_power_plants", ["owner_id"], name: "index_diesel_power_plants_on_owner_id", using: :btree

  create_table "duel_fuel_power_plant_translations", force: true do |t|
    t.integer  "duel_fuel_power_plant_id"
    t.string   "locale"
    t.string   "name"
    t.text     "owner"
    t.text     "operating_organization"
    t.string   "generators_brand"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "duel_fuel_power_plant_translations", ["duel_fuel_power_plant_id"], name: "index_a6af833bf38c3e8a10e261ece4a135a9e34a6a3c", using: :btree
  add_index "duel_fuel_power_plant_translations", ["locale"], name: "index_duel_fuel_power_plant_translations_on_locale", using: :btree

  create_table "duel_fuel_power_plants", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.integer  "city_id"
    t.text     "owner"
    t.text     "operating_organization"
    t.string   "year_start"
    t.float    "installed_power"
    t.float    "having_power"
    t.string   "generators_brand"
    t.float    "generators_power"
    t.string   "generators_release_year"
    t.date     "relevance"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "duel_fuel_power_plants", ["city_id"], name: "index_duel_fuel_power_plants_on_city_id", using: :btree
  add_index "duel_fuel_power_plants", ["owner_id"], name: "index_duel_fuel_power_plants_on_owner_id", using: :btree

  create_table "economic_activities", force: true do |t|
    t.integer  "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "economic_activities", ["code"], name: "index_economic_activities_on_code", using: :btree

  create_table "economic_activity_translations", force: true do |t|
    t.integer  "economic_activity_id"
    t.string   "locale"
    t.text     "name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "economic_activity_translations", ["economic_activity_id"], name: "index_832465fdc4cf8eeee498f48f0e2dbcd1c17ae04", using: :btree
  add_index "economic_activity_translations", ["locale"], name: "index_economic_activity_translations_on_locale", using: :btree

  create_table "electric_power_transmission_translations", force: true do |t|
    t.integer  "electric_power_transmission_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.text     "supplier"
    t.text     "owner"
    t.text     "operating_organization"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "electric_power_transmission_translations", ["electric_power_transmission_id"], name: "index_881562bbe5b9abfb5fe53869aac34b3093e5dd81", using: :btree
  add_index "electric_power_transmission_translations", ["locale"], name: "index_electric_power_transmission_translations_on_locale", using: :btree

  create_table "electric_power_transmissions", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.text     "description"
    t.text     "supplier"
    t.integer  "transmission_class"
    t.integer  "city_from_id"
    t.integer  "city_to_id"
    t.string   "number"
    t.text     "owner"
    t.text     "operating_organization"
    t.date     "relevance"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "electric_power_transmissions", ["city_from_id"], name: "index_electric_power_transmissions_on_city_from_id", using: :btree
  add_index "electric_power_transmissions", ["city_to_id"], name: "index_electric_power_transmissions_on_city_to_id", using: :btree
  add_index "electric_power_transmissions", ["owner_id"], name: "index_electric_power_transmissions_on_owner_id", using: :btree

  create_table "gas_distribution_station_translations", force: true do |t|
    t.integer  "gas_distribution_station_id"
    t.string   "locale"
    t.text     "name"
    t.text     "description"
    t.text     "owner"
    t.text     "operating_organization"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "gas_distribution_station_translations", ["gas_distribution_station_id"], name: "index_x2qavbn4awerty140304a2cfe92b74c8d48138ef", using: :btree
  add_index "gas_distribution_station_translations", ["locale"], name: "index_gas_distribution_station_id_on_locale", using: :btree

  create_table "gas_distribution_stations", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "municipality_id"
    t.integer  "city_id"
    t.float    "out_1"
    t.float    "thousand_m3h_1"
    t.float    "million_m3y_1"
    t.float    "project_million_m3y_1"
    t.float    "actual_million_m3y_1"
    t.float    "loading_1"
    t.float    "out_2"
    t.float    "thousand_m3h_2"
    t.float    "million_m3y_2"
    t.float    "project_million_m3y_2"
    t.float    "actual_million_m3y_2"
    t.float    "loading_2"
    t.text     "owner"
    t.date     "relevance"
    t.text     "coords"
    t.text     "operating_organization"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gas_distribution_stations", ["city_id"], name: "index_gas_distribution_stations_on_city_id", using: :btree
  add_index "gas_distribution_stations", ["municipality_id"], name: "index_gas_distribution_stations_on_municipality_id", using: :btree
  add_index "gas_distribution_stations", ["owner_id"], name: "index_gas_distribution_stations_on_owner_id", using: :btree

  create_table "gas_pipeline_translations", force: true do |t|
    t.integer  "gas_pipeline_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.text     "owner"
    t.text     "operating_organization"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "gas_pipeline_translations", ["gas_pipeline_id"], name: "index_gas_pipeline_translations_on_gas_pipeline_id", using: :btree
  add_index "gas_pipeline_translations", ["locale"], name: "index_gas_pipeline_translations_on_locale", using: :btree

  create_table "gas_pipelines", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.text     "description"
    t.string   "number"
    t.float    "diameter"
    t.float    "length"
    t.text     "owner"
    t.date     "relevance"
    t.text     "operating_organization"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gas_pipelines", ["owner_id"], name: "index_gas_pipelines_on_owner_id", using: :btree

  create_table "geothermal_electricity_plant_translations", force: true do |t|
    t.integer  "geothermal_electricity_plant_id"
    t.string   "locale"
    t.string   "name"
    t.text     "owner"
    t.text     "operating_organization"
    t.string   "generators_brand"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "geothermal_electricity_plant_translations", ["geothermal_electricity_plant_id"], name: "index_fa484cc512ad39f68c8f32082e9fe63e0c820aaf", using: :btree
  add_index "geothermal_electricity_plant_translations", ["locale"], name: "index_geothermal_electricity_plant_translations_on_locale", using: :btree

  create_table "geothermal_electricity_plants", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.integer  "city_id"
    t.text     "owner"
    t.text     "operating_organization"
    t.string   "year_start"
    t.float    "installed_power"
    t.float    "having_power"
    t.string   "generators_brand"
    t.float    "generators_power"
    t.string   "generators_release_year"
    t.date     "relevance"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "geothermal_electricity_plants", ["city_id"], name: "index_geothermal_electricity_plants_on_city_id", using: :btree
  add_index "geothermal_electricity_plants", ["owner_id"], name: "index_geothermal_electricity_plants_on_owner_id", using: :btree

  create_table "heat_only_boiler_station_translations", force: true do |t|
    t.integer  "heat_only_boiler_station_id"
    t.string   "locale"
    t.string   "name"
    t.text     "owner"
    t.text     "operating_organization"
    t.text     "fuel_type"
    t.text     "boiler_type"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "heat_only_boiler_station_translations", ["heat_only_boiler_station_id"], name: "index_8c932b3b7f9e06930e8430b28f417337e97b489b", using: :btree
  add_index "heat_only_boiler_station_translations", ["locale"], name: "index_heat_only_boiler_station_translations_on_locale", using: :btree

  create_table "heat_only_boiler_stations", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.string   "year_start"
    t.text     "owner"
    t.text     "operating_organization"
    t.text     "fuel_type"
    t.text     "boiler_type"
    t.integer  "boiler_count"
    t.string   "boiler_year_start"
    t.float    "boiler_power"
    t.float    "connected_load"
    t.float    "boiler_performance"
    t.float    "heat_production_in_year"
    t.date     "relevance"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "heat_only_boiler_stations", ["owner_id"], name: "index_heat_only_boiler_stations_on_owner_id", using: :btree

  create_table "heating_main_translations", force: true do |t|
    t.integer  "heating_main_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.text     "owner"
    t.text     "operating_organization"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "heating_main_translations", ["heating_main_id"], name: "index_heating_main_translations_on_heating_main_id", using: :btree
  add_index "heating_main_translations", ["locale"], name: "index_heating_main_translations_on_locale", using: :btree

  create_table "heating_mains", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.text     "description"
    t.float    "diameter"
    t.float    "length"
    t.text     "owner"
    t.text     "operating_organization"
    t.date     "relevance"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "heating_mains", ["owner_id"], name: "index_heating_mains_on_owner_id", using: :btree

  create_table "hydro_plant_translations", force: true do |t|
    t.integer  "hydro_plant_id"
    t.string   "locale"
    t.string   "name"
    t.text     "owner"
    t.text     "operating_organization"
    t.string   "generators_brand"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "hydro_plant_translations", ["hydro_plant_id"], name: "index_hydro_plant_translations_on_hydro_plant_id", using: :btree
  add_index "hydro_plant_translations", ["locale"], name: "index_hydro_plant_translations_on_locale", using: :btree

  create_table "hydro_plants", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.integer  "city_id"
    t.text     "owner"
    t.text     "operating_organization"
    t.string   "year_start"
    t.float    "installed_power"
    t.float    "having_power"
    t.string   "generators_brand"
    t.float    "generators_power"
    t.string   "generators_release_year"
    t.date     "relevance"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hydro_plants", ["city_id"], name: "index_hydro_plants_on_city_id", using: :btree
  add_index "hydro_plants", ["owner_id"], name: "index_hydro_plants_on_owner_id", using: :btree

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
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "industrial_parks", force: true do |t|
    t.integer  "municipality_id"
    t.string   "name"
    t.string   "park_type"
    t.text     "description"
    t.text     "coords"
    t.string   "company"
    t.text     "legal_address"
    t.string   "contact_person"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.text     "address"
    t.float    "free_square"
    t.text     "residents"
    t.float    "nearest_houses_distance"
    t.text     "authorized_activities"
    t.text     "protection_zones"
    t.text     "transport_driveways"
    t.text     "services"
    t.float    "central_region_distance"
    t.float    "another_region_distance"
    t.float    "city_distance"
    t.float    "road_distance"
    t.float    "airport_distance"
    t.float    "seaport_distance"
    t.boolean  "gas"
    t.string   "gas_details"
    t.boolean  "heating"
    t.string   "heating_details"
    t.boolean  "electricity"
    t.string   "electricity_details"
    t.boolean  "water"
    t.string   "water_details"
    t.boolean  "sewerage"
    t.string   "sewerage_details"
    t.boolean  "sewage_plants"
    t.string   "sewage_plants_details"
    t.boolean  "boiler_system"
    t.string   "boiler_system_details"
    t.boolean  "demo_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "industrial_parks", ["municipality_id"], name: "index_industrial_parks_on_municipality_id", using: :btree

  create_table "intake_translations", force: true do |t|
    t.integer  "intake_id"
    t.string   "locale"
    t.string   "name"
    t.text     "intake_type"
    t.text     "address"
    t.text     "owner"
    t.text     "operating_organization"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "intake_translations", ["intake_id"], name: "index_intake_translations_on_intake_id", using: :btree
  add_index "intake_translations", ["locale"], name: "index_intake_translations_on_locale", using: :btree

  create_table "intakes", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.text     "intake_type"
    t.text     "address"
    t.text     "owner"
    t.text     "operating_organization"
    t.string   "year_start"
    t.float    "power"
    t.float    "water_supplied_to_net"
    t.date     "relevance"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "intakes", ["owner_id"], name: "index_intakes_on_owner_id", using: :btree

  create_table "land_categories", force: true do |t|
    t.string   "name"
    t.integer  "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "land_category_translations", force: true do |t|
    t.integer  "land_category_id"
    t.string   "locale"
    t.text     "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "land_category_translations", ["land_category_id"], name: "index_c94f253b5bffd256f9440186ba54d263a3c7730f", using: :btree
  add_index "land_category_translations", ["locale"], name: "index_land_category_translations_on_locale", using: :btree

  create_table "municipalities", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "coords"
    t.integer  "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.string   "area"
    t.string   "density"
    t.string   "population"
    t.string   "chief"
    t.string   "status"
    t.string   "based"
    t.string   "distance_to_petropavlovsk_kamchatsky"
    t.string   "contacts"
    t.string   "average_wage"
    t.integer  "number_of_unemployed"
    t.string   "registered_unemployment"
    t.boolean  "demo_mode"
  end

  add_index "municipalities", ["owner_id"], name: "index_municipalities_on_owner_id", using: :btree

  create_table "municipality_translations", force: true do |t|
    t.integer  "municipality_id"
    t.string   "locale"
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "area"
    t.string   "density"
    t.string   "population"
    t.string   "chief"
    t.string   "status"
    t.string   "based"
    t.string   "distance_to_petropavlovsk_kamchatsky"
    t.string   "contacts"
  end

  add_index "municipality_translations", ["locale"], name: "index_municipality_translations_on_locale", using: :btree
  add_index "municipality_translations", ["municipality_id"], name: "index_5e3a25223de7bbd82d27edc481fa389849010cae", using: :btree

  create_table "natural_resource_translations", force: true do |t|
    t.integer  "natural_resource_id"
    t.string   "locale"
    t.text     "description"
    t.text     "additional_information"
    t.string   "licence"
    t.text     "content"
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "natural_resource_translations", ["locale"], name: "index_natural_resource_translations_on_locale", using: :btree
  add_index "natural_resource_translations", ["natural_resource_id"], name: "index_b3cf7abcae9f4d5b15fc40bce46a0bcde690b89a", using: :btree

  create_table "natural_resource_type_translations", force: true do |t|
    t.integer  "natural_resource_type_id"
    t.string   "locale"
    t.text     "name"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "natural_resource_type_translations", ["locale"], name: "index_natural_resource_type_translations_on_locale", using: :btree
  add_index "natural_resource_type_translations", ["natural_resource_type_id"], name: "index_26f4f92699c34cc60928bcf71622ad739a295aee", using: :btree

  create_table "natural_resource_types", force: true do |t|
    t.string   "name"
    t.integer  "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
    t.integer  "map_format"
  end

  create_table "natural_resources", force: true do |t|
    t.text     "description"
    t.integer  "code"
    t.integer  "natural_resource_type_code"
    t.string   "coords"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "owner_id"
    t.string   "name"
    t.text     "content"
    t.float    "reserve"
    t.string   "licence"
    t.text     "additional_information"
  end

  create_table "ownership_type_translations", force: true do |t|
    t.integer  "ownership_type_id"
    t.string   "locale"
    t.text     "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "ownership_type_translations", ["locale"], name: "index_ownership_type_translations_on_locale", using: :btree
  add_index "ownership_type_translations", ["ownership_type_id"], name: "index_b6a5bfe6ee0a24540304a2cfe92b74c8d48138ef", using: :btree

  create_table "ownership_types", force: true do |t|
    t.string   "name"
    t.integer  "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_fragment_translations", force: true do |t|
    t.integer  "page_fragment_id", null: false
    t.string   "locale",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  create_table "page_fragments", force: true do |t|
    t.string   "key"
    t.string   "content_type"
    t.text     "validation"
    t.text     "content"
    t.boolean  "hidden",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.integer  "target_id"
    t.string   "target_type"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pictures", ["target_id", "target_type"], name: "index_pictures_on_target_id_and_target_type", using: :btree

  create_table "platform_translations", force: true do |t|
    t.integer  "platform_id"
    t.string   "locale"
    t.string   "name"
    t.text     "type"
    t.text     "description"
    t.text     "legal_address"
    t.text     "contact_person"
    t.text     "address"
    t.text     "land_ownership_type"
    t.text     "company_text"
    t.text     "expandable"
    t.text     "nearby_facilities"
    t.text     "limitations"
    t.text     "expected_permitted_use"
    t.text     "government_agency_providing_land"
    t.text     "sanitary_protection_zones"
    t.text     "transportation_driveways"
    t.text     "buildings"
    t.text     "heating_details"
    t.text     "electricity_details"
    t.text     "water_details"
    t.text     "sewerage_details"
    t.text     "sewage_plants_details"
    t.text     "boiler_system_details"
    t.text     "service"
    t.text     "additional_information"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "platform_translations", ["locale"], name: "index_platform_translations_on_locale", using: :btree
  add_index "platform_translations", ["platform_id"], name: "index_632465fdc4cf9aaee498f48f0e2dbcd1c17ae04", using: :btree

  create_table "platforms", force: true do |t|
    t.integer  "code"
    t.integer  "municipality_id"
    t.text     "coords"
    t.string   "name"
    t.string   "key"
    t.text     "type"
    t.text     "description"
    t.integer  "company_id"
    t.integer  "owner_id"
    t.text     "legal_address"
    t.text     "contact_person"
    t.text     "contact_person_email"
    t.text     "contact_person_phone"
    t.text     "address"
    t.float    "area"
    t.text     "land_ownership_type"
    t.text     "expandable"
    t.text     "nearby_facilities"
    t.float    "nearest_houses_distance"
    t.text     "limitations"
    t.integer  "land_category_code"
    t.text     "expected_permitted_use"
    t.text     "government_agency_providing_land"
    t.text     "cadastral_number"
    t.text     "sanitary_protection_zones"
    t.text     "transportation_driveways"
    t.text     "platform_type"
    t.float    "region_distance"
    t.float    "city_distance"
    t.float    "road_distance"
    t.float    "airport_distance"
    t.float    "seaport_distance"
    t.boolean  "gas"
    t.string   "gas_details"
    t.boolean  "heating"
    t.string   "heating_details"
    t.boolean  "electricity"
    t.string   "electricity_details"
    t.boolean  "water"
    t.string   "water_details"
    t.boolean  "sewerage"
    t.string   "sewerage_details"
    t.boolean  "sewage_plants"
    t.string   "sewage_plants_details"
    t.boolean  "boiler_system"
    t.string   "boiler_system_details"
    t.integer  "ownership_type_code"
    t.text     "company_text"
    t.boolean  "demo_mode"
    t.text     "buildings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "permitted_uses"
    t.string   "remote_code"
  end

  add_index "platforms", ["company_id"], name: "index_platforms_on_company_id", using: :btree
  add_index "platforms", ["municipality_id"], name: "index_platforms_on_municipality_id", using: :btree
  add_index "platforms", ["owner_id"], name: "index_platforms_on_owner_id", using: :btree

  create_table "point_of_interest_translations", force: true do |t|
    t.integer  "point_of_interest_id"
    t.string   "locale"
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "point_of_interest_type_translations", force: true do |t|
    t.integer  "point_of_interest_type_id"
    t.string   "locale"
    t.text     "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "point_of_interest_types", force: true do |t|
    t.string   "name"
    t.integer  "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
  end

  create_table "point_of_interests", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.text     "description"
    t.text     "owner"
    t.integer  "owner_id"
    t.integer  "point_of_interest_type_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "point_of_interests", ["owner_id"], name: "index_point_of_interests_on_owner_id", using: :btree

  create_table "project_translations", force: true do |t|
    t.integer  "project_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.text     "territory_description"
    t.text     "availability_of_raw"
    t.text     "planned_production"
    t.text     "consumer_market_description"
    t.text     "readiness"
    t.text     "financial_evaluation"
    t.text     "key_performance_indicators"
    t.text     "social_significance"
    t.text     "investment_return_forms"
    t.text     "additional_info"
    t.string   "territory"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "project_type_translations", force: true do |t|
    t.integer  "project_type_id"
    t.string   "locale"
    t.text     "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "project_type_translations", ["locale"], name: "index_project_type_translations_on_locale", using: :btree
  add_index "project_type_translations", ["project_type_id"], name: "index_b6fbec0b0b93e684e7e73179c6d760a5fcec77c4", using: :btree

  create_table "project_types", force: true do |t|
    t.string   "name"
    t.integer  "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "code"
    t.text     "coords"
    t.string   "key"
    t.integer  "company_id"
    t.text     "description"
    t.integer  "owner_id"
    t.integer  "economic_activity_code"
    t.text     "territory_description"
    t.text     "availability_of_raw"
    t.text     "planned_production"
    t.text     "consumer_market_description"
    t.text     "readiness"
    t.text     "financial_evaluation"
    t.text     "common_price"
    t.float    "own_investments"
    t.float    "required_investments"
    t.text     "key_performance_indicators"
    t.integer  "npv"
    t.integer  "irr"
    t.integer  "pi"
    t.integer  "payback_period"
    t.text     "social_significance"
    t.integer  "jobs"
    t.integer  "budget_efficiency"
    t.text     "investment_return_forms"
    t.text     "additional_info"
    t.boolean  "demo_mode"
    t.integer  "project_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "territory"
    t.string   "remote_code"
    t.integer  "municipality_id"
  end

  add_index "projects", ["company_id"], name: "index_projects_on_company_id", using: :btree
  add_index "projects", ["economic_activity_code"], name: "index_projects_on_economic_activity_code", using: :btree
  add_index "projects", ["owner_id"], name: "index_projects_on_owner_id", using: :btree
  add_index "projects", ["project_type_id"], name: "index_projects_on_project_type_id", using: :btree

  create_table "sewer_translations", force: true do |t|
    t.integer  "sewer_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.text     "owner"
    t.text     "operating_organization"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sewer_translations", ["locale"], name: "index_sewer_translations_on_locale", using: :btree
  add_index "sewer_translations", ["sewer_id"], name: "index_sewer_translations_on_sewer_id", using: :btree

  create_table "sewers", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.text     "description"
    t.text     "owner"
    t.text     "operating_organization"
    t.string   "year_start"
    t.float    "power"
    t.date     "relevance"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sewers", ["owner_id"], name: "index_sewers_on_owner_id", using: :btree

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
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "special_economic_zone_type_translations", force: true do |t|
    t.integer  "special_economic_zone_type_id", null: false
    t.string   "locale",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "special_economic_zone_type_translations", ["locale"], name: "index_special_economic_zone_type_translations_on_locale", using: :btree
  add_index "special_economic_zone_type_translations", ["special_economic_zone_type_id"], name: "index_fd74a34fbc53d3a202b1903c5bbfac7e71c3fb1c", using: :btree

  create_table "special_economic_zone_types", force: true do |t|
    t.string   "name"
    t.integer  "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "special_economic_zones", force: true do |t|
    t.string   "name"
    t.string   "sez_type"
    t.integer  "municipality_id"
    t.text     "coords"
    t.string   "company"
    t.string   "contact_person"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.text     "address"
    t.float    "free_square"
    t.text     "residents"
    t.text     "authorized_activities"
    t.text     "protection_zones"
    t.text     "transport_driveways"
    t.text     "resident_privileges"
    t.float    "central_region_distance"
    t.float    "city_distance"
    t.float    "road_distance"
    t.float    "airport_distance"
    t.float    "seaport_distance"
    t.boolean  "gas"
    t.string   "gas_details"
    t.boolean  "heating"
    t.string   "heating_details"
    t.boolean  "electricity"
    t.string   "electricity_details"
    t.boolean  "water"
    t.string   "water_details"
    t.boolean  "sewerage"
    t.string   "sewerage_details"
    t.boolean  "sewage_plants"
    t.string   "sewage_plants_details"
    t.boolean  "boiler_system"
    t.string   "boiler_system_details"
    t.boolean  "demo_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remote_code"
    t.integer  "special_economic_zone_type_code"
  end

  add_index "special_economic_zones", ["municipality_id"], name: "index_special_economic_zones_on_municipality_id", using: :btree

  create_table "transformer_substation_translations", force: true do |t|
    t.integer  "transformer_substation_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.text     "owner"
    t.text     "category"
    t.text     "district"
    t.text     "address"
    t.text     "operating_organization"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "transformer_substation_translations", ["locale"], name: "index_transformer_substation_translations_on_locale", using: :btree
  add_index "transformer_substation_translations", ["transformer_substation_id"], name: "index_d919d8f9360560fc7c69098f3147e805f03f4476", using: :btree

  create_table "transformer_substations", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.text     "description"
    t.string   "number"
    t.text     "owner"
    t.text     "category"
    t.text     "district"
    t.text     "address"
    t.text     "operating_organization"
    t.date     "relevance"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transformer_substations", ["owner_id"], name: "index_transformer_substations_on_owner_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "phone"
    t.integer  "company_id"
    t.text     "invitation_token"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.datetime "invitation_created_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wastewater_treatment_plant_translations", force: true do |t|
    t.integer  "wastewater_treatment_plant_id"
    t.string   "locale"
    t.string   "name"
    t.text     "build_type"
    t.text     "address"
    t.text     "owner"
    t.text     "operating_organization"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "wastewater_treatment_plant_translations", ["locale"], name: "index_wastewater_treatment_plant_translations_on_locale", using: :btree
  add_index "wastewater_treatment_plant_translations", ["wastewater_treatment_plant_id"], name: "index_ec05eaf4537e1709c4a9a7662980e2338a357f23", using: :btree

  create_table "wastewater_treatment_plants", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.text     "build_type"
    t.text     "address"
    t.text     "owner"
    t.text     "operating_organization"
    t.string   "year_start"
    t.float    "power"
    t.float    "conceded_wastewater"
    t.date     "relevance"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wastewater_treatment_plants", ["owner_id"], name: "index_wastewater_treatment_plants_on_owner_id", using: :btree

  create_table "water_supplies", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.text     "description"
    t.text     "owner"
    t.text     "operating_organization"
    t.string   "year_start"
    t.float    "power"
    t.date     "relevance"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "water_supplies", ["owner_id"], name: "index_water_supplies_on_owner_id", using: :btree

  create_table "water_supply_translations", force: true do |t|
    t.integer  "water_supply_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.text     "owner"
    t.text     "operating_organization"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "water_supply_translations", ["locale"], name: "index_water_supply_translations_on_locale", using: :btree
  add_index "water_supply_translations", ["water_supply_id"], name: "index_water_supply_translations_on_water_supply_id", using: :btree

  create_table "wind_plant_translations", force: true do |t|
    t.integer  "wind_plant_id"
    t.string   "locale"
    t.string   "name"
    t.text     "owner"
    t.text     "operating_organization"
    t.string   "generators_brand"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "wind_plant_translations", ["locale"], name: "index_wind_plant_translations_on_locale", using: :btree
  add_index "wind_plant_translations", ["wind_plant_id"], name: "index_wind_plant_translations_on_wind_plant_id", using: :btree

  create_table "wind_plants", force: true do |t|
    t.string   "name"
    t.text     "coords"
    t.integer  "city_id"
    t.text     "owner"
    t.text     "operating_organization"
    t.string   "year_start"
    t.float    "installed_power"
    t.float    "having_power"
    t.string   "generators_brand"
    t.float    "generators_power"
    t.string   "generators_release_year"
    t.date     "relevance"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wind_plants", ["city_id"], name: "index_wind_plants_on_city_id", using: :btree
  add_index "wind_plants", ["owner_id"], name: "index_wind_plants_on_owner_id", using: :btree

end
