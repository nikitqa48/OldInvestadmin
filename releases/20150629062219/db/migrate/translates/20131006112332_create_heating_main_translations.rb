class CreateHeatingMainTranslations < ActiveRecord::Migration
  def change
    create_table :heating_main_translations do |t|
      t.integer  'heating_main_id'
      t.string   'locale'
      t.string   'name'
      t.text     'description'
      t.text     'owner'
      t.text     'operating_organization'
      t.datetime 'created_at',             :null => false
      t.datetime 'updated_at',             :null => false
    end
    add_index 'heating_main_translations', ['heating_main_id'], :name => 'index_heating_main_translations_on_heating_main_id'
    add_index 'heating_main_translations', ['locale'], :name => 'index_heating_main_translations_on_locale'
  end
end
