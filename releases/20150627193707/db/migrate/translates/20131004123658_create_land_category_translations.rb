class CreateLandCategoryTranslations < ActiveRecord::Migration
  def change
    create_table 'land_category_translations' do |t|
      t.integer  'land_category_id'
      t.string   'locale'
      t.text     'name'
      t.datetime 'created_at',       :null => false
      t.datetime 'updated_at',       :null => false
    end

    add_index 'land_category_translations', ['land_category_id'], :name => 'index_c94f253b5bffd256f9440186ba54d263a3c7730f'
    add_index 'land_category_translations', ['locale'], :name => 'index_land_category_translations_on_locale'
  end
end
