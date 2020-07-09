class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.role? :admin
        can :manage, :all

      elsif user.role? :manager

        can :read, :all

        information_layers = [
            Project, Company, Platform, Municipality, City, SpecialEconomicZone,
            IndustrialPark, NaturalResource, DevelopmentPlan
        ]

        infrastructures = [
            CentralHeatingUnit, DieselPowerPlant, DuelFuelPowerPlant, ElectricPowerTransmission,
            GasDistributionStation, GasPipeline, GeothermalElectricityPlant, HeatOnlyBoilerStation,
            HeatingMain, HydroPlant, Intake, Sewer, TransformerSubstation, WastewaterTreatmentPlant,
            WaterSupply, WindPlant, PointOfInterest
        ]

        (information_layers + infrastructures).each do |model|
          can :create, model
          can [:update, :destroy], model, :owner_id => user.id
        end

        can :update, User, id: user.id
        cannot [:create, :destroy], User

      end
    end
  end

end
