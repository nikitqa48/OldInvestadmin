class CreateDevelopmentPlanTypes < ActiveRecord::Migration
  def change
    create_table :development_plan_types do |t|
      t.string :name
      t.integer :code
      t.timestamps
    end
    add_column :development_plans, :development_plan_type_code, :integer
  end
end
