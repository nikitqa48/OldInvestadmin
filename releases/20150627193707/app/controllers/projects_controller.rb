class ProjectsController < Information::BaseController
  before_action :fill_variables, except: [:show, :index]
  private

  def fill_variables
    @companies = Company.accessible_by(current_ability)
    @municipalities = Municipality.accessible_by(current_ability)
    @economic_activities = EconomicActivity.accessible_by(current_ability)
    @project_types = ProjectType.accessible_by(current_ability)
  end


  def resource_params
    allowed = [:name, :coords, :company_id, :description, :business_project, :owner_id,
               :economic_activity_code, :territory, :territory_description, :availability_of_raw,
               :planned_production, :consumer_market_description, :readiness, :financial_evaluation,
               :common_price, :own_investments, :required_investments, :key_performance_indicators,
               :npv, :irr, :pi, :payback_period, :social_significance, :jobs, :budget_efficiency,
               :investment_return_forms, :additional_info, :municipality_id, :key, :project_type_id, :demo_mode]
    super(allowed, pictures: true)
  end
end