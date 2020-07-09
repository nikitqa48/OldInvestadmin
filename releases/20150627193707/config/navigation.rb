SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|

    primary.item(:information_layer, t('navigation.information_layers'), '#') do |submenu|
      [:projects,
       :clusters,
       :companies, :platforms, :municipalities, :cities, :special_economic_zones,
      :industrial_parks, :natural_resources, :development_plans]
      .each { |item| submenu.item item, t("#{item}.index.title"), send("#{item}_path") }
    end

    primary.item(:infrastructure, t('navigation.infrastructure'), '#') do |submenu|
      [
          :gas_distribution_stations, :gas_pipelines,
          :____,
          :heat_only_boiler_stations, :central_heating_units, :heating_mains,
          :____,
          :diesel_power_plants, :duel_fuel_power_plants, :geothermal_electricity_plants,
          :hydro_plants, :wind_plants, :transformer_substations, :electric_power_transmissions,
          :____,
          :intakes, :water_supplies,
          :____,
          :wastewater_treatment_plants, :sewers,
          :____,
          :point_of_interests
      ]
      .each do |item|
        if item == :____
          submenu.item :divider, '', '#', class: 'divider'
        else
          submenu.item item, t("infrastructure.#{item}.index.title"), send("infrastructure_#{item}_path")
        end
      end
    end

    primary.item(:directories, t('navigation.directories'), '#') do |submenu|
      [:ownership_types, :land_categories, :project_types, :activity_spheres, :economic_activities,
       :natural_resource_types, :point_of_interest_types, :special_economic_zone_types, :development_plan_types]
      .each { |item| submenu.item item, t("directory.#{item}.index.title"), send("directory_#{item}_path") }
    end

    if current_user && current_user.role?(:admin)
      primary.item :users, t('navigation.users'), users_path
    end

    if user_signed_in?
      primary.item(:user_menu, current_user.email, '#') do |submenu|
        submenu.item :user_show, t('navigation.user_show'), user_path(current_user)
        submenu.item :user_edit, t('navigation.user_edit'), edit_user_path(current_user)
        submenu.item :user_exit, t('navigation.user_exit'), destroy_user_session_path, :method => :delete
      end
    end
    primary.dom_class = 'nav navbar-nav'
  end
end