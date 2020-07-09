class PoiTypeTranslations < ActiveRecord::Migration
  def change
    create_table "point_of_interest_type_translations" do |t|
      t.integer  "point_of_interest_type_id"
      t.string   "locale"
      t.text     "name"
      t.datetime "created_at",               :null => false
      t.datetime "updated_at",               :null => false
    end

    #add_index 'point_of_interest_type_translations', ['point_of_interest_type_id'], :name => 'index_point_of_interest_type_translations_on_point_of_interest_type_id'
    #add_index 'point_of_interest_type_translations', ['locale'], :name => 'index_point_of_interest_type_translations_on_locale'
  end
end