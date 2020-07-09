class CreateNaturalResourceTypeTranslations < ActiveRecord::Migration
  def change
    create_table "natural_resource_type_translations" do |t|
      t.integer  "natural_resource_type_id"
      t.string   "locale"
      t.text     "name"
      t.datetime "created_at",               :null => false
      t.datetime "updated_at",               :null => false
    end

    add_index "natural_resource_type_translations", ["locale"], :name => "index_natural_resource_type_translations_on_locale"
    add_index "natural_resource_type_translations", ["natural_resource_type_id"], :name => "index_26f4f92699c34cc60928bcf71622ad739a295aee"
  end
end