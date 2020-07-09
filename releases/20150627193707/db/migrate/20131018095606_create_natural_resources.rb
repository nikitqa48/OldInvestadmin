class CreateNaturalResources < ActiveRecord::Migration
  def change
    create_table "natural_resources" do |t|
      t.string   "description"
      t.integer  "code"
      t.integer  "natural_resource_type_code"
      t.string   "coords"
      t.datetime "created_at",                 :null => false
      t.datetime "updated_at",                 :null => false
      t.integer  "owner_id"
      t.string "name"
      t.text "content"
      t.float "reserve"
      t.string "licence"
      t.text "additional_information"
    end
  end
end
