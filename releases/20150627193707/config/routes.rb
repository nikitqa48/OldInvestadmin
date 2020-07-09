LipetskAdmin::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, path_prefix: 'devise'
  root to: 'projects#index'

  resources :users
  resources :gallery_pictures, only: :destroy
  #

  resources :page_fragments, :only => [:index, :edit, :update, :destroy]

  resources :projects, :companies, :municipalities, :cities, :special_economic_zones,
            :industrial_parks, :natural_resources, :platforms, :development_plans, :clusters

  namespace :directory do
    resources :project_types, :activity_spheres, :economic_activities, :development_plan_types,
              :land_categories, :ownership_types, :natural_resource_types,
              :point_of_interest_types, :special_economic_zone_types
  end

  namespace :infrastructure do
    resources :gas_distribution_stations, :gas_pipelines, :heat_only_boiler_stations,
              :central_heating_units, :heating_mains, :diesel_power_plants, :duel_fuel_power_plants,
              :geothermal_electricity_plants, :hydro_plants, :wind_plants, :transformer_substations,
              :electric_power_transmissions, :intakes, :water_supplies, :wastewater_treatment_plants,
              :sewers, :point_of_interests
  end

  get "export" => "exports#export"
  get "mailer" => "mailer#create"
  get "request" => "mailer#new"
end  