class CreateDevelopmentPlans < ActiveRecord::Migration
  def change
    create_table :development_plans do |t|
      t.string :name
      t.text :description
      t.text     :coords
      t.integer  :owner_id
      t.timestamps
    end
    create_table "development_plan_translations", force: true do |t|
      t.integer  "development_plan_id"
      t.string   "locale"
      t.string   "name"
      t.text     "description"
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
    end
  end
end
