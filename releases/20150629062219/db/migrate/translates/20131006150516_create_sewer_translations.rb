class CreateSewerTranslations < ActiveRecord::Migration
  def change
    create_table :sewer_translations do |t|
      t.integer  'sewer_id'
      t.string   'locale'
      t.string   'name'
      t.text     'description'
      t.text     'owner'
      t.text     'operating_organization'
      t.datetime 'created_at',             :null => false
      t.datetime 'updated_at',             :null => false
    end

    add_index 'sewer_translations', ['locale'], :name => 'index_sewer_translations_on_locale'
    add_index 'sewer_translations', ['sewer_id'], :name => 'index_sewer_translations_on_sewer_id'
  end
end