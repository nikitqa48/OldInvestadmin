class ExportsController < ApplicationController
  def authenticate_user!
        #disabled
  end
  def export
    locale = params[:l]
    I18n.locale = locale.to_sym if locale
    export = {}

    export[:directories] = {
        :activity_spheres => ActivitySphere.export,
        :economic_activities => EconomicActivity.export,
        :land_categories => LandCategory.export,
        :ownership_types => OwnershipType.export,
        :project_types => ProjectType.export,
        :natural_resource_types => NaturalResourceType.export,
        :point_of_interest_types => PointOfInterestType.export,
        :development_plan_types => DevelopmentPlanType.export,
        :special_economic_zone_types => SpecialEconomicZoneType.export
    }

    export.merge!({
        :projects => Project.export,
        :clusters => Cluster.export,
        :companies => Company.export,
        :platforms => Platform.export,
        :municipalities => Municipality.export,
        :cities => City.export,
        :special_economic_zones => SpecialEconomicZone.export,
        :industrial_parks => IndustrialPark.export,
        :natural_resources => NaturalResource.export,
        :development_plans => DevelopmentPlan.export,
        :page_fragments => PageFragment.export
    })

    export[:infrastructures] = {
        :central_heating_units => CentralHeatingUnit.export,
        :diesel_power_plants => DieselPowerPlant.export,
        :duel_fuel_power_plants => DuelFuelPowerPlant.export,
        :electric_power_transmissions => ElectricPowerTransmission.export,
        :gas_distribution_stations => GasDistributionStation.export,
        :gas_pipelines => GasPipeline.export,
        :geothermal_electricity_plants => GeothermalElectricityPlant.export,
        :heat_only_boiler_stations => HeatOnlyBoilerStation.export,
        :heating_mains => HeatingMain.export,
        :hydro_plants => HydroPlant.export,
        :intakes => Intake.export,
        :sewers => Sewer.export,
        :transformer_substations => TransformerSubstation.export,
        :wastewater_treatment_plants => WastewaterTreatmentPlant.export,
        :water_supplies => WaterSupply.export,
        :wind_plants => WindPlant.export,
        :point_of_interests => PointOfInterest.export
    }

    render :text => export.to_jsonp(params), :content_type => "application/javascript"
  end

end