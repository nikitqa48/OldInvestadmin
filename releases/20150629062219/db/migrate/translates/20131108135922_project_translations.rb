class ProjectTranslations < ActiveRecord::Migration
  def change
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
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
    end
  end
end
