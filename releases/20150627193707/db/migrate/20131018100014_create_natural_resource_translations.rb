class CreateNaturalResourceTranslations < ActiveRecord::Migration
  def change
    create_table "natural_resource_translations" do |t|
      t.integer  "natural_resource_id"
      t.string   "locale"
      t.text     "description"
      t.text "additional_information"
      t.string "licence"
      t.text "content"
      t.string "name"
      t.datetime "created_at",          :null => false
      t.datetime "updated_at",          :null => false
    end

    add_index "natural_resource_translations", ["locale"], :name => "index_natural_resource_translations_on_locale"
    add_index "natural_resource_translations", ["natural_resource_id"], :name => "index_b3cf7abcae9f4d5b15fc40bce46a0bcde690b89a"
  end
end
