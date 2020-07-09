class CreateNaturalResourceTypes < ActiveRecord::Migration
  def change
    create_table :natural_resource_types do |t|
      t.string   "name"
      t.integer  "code"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
      t.string   "icon"
      t.integer  :map_format
      t.timestamps
    end
  end
end
