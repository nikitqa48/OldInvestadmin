class PoiType < ActiveRecord::Migration
  def change
    create_table :point_of_interest_types do |t|
      t.string   "name"
      t.integer  "code"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
      t.string   "icon"
      t.timestamps
    end
  end
end