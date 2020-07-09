class CreateCityTranslations < ActiveRecord::Migration
  def change
    create_table 'city_translations' do |t|
      t.integer 'city_id'
      t.string 'locale'
      t.text 'name'
      t.text 'description'
      t.string 'based'
      t.string 'chief'
      t.string 'site'
      t.string 'density'
      t.string 'subdivisions'
      t.string 'economically_active_population'

      t.datetime 'created_at', :null => false
      t.datetime 'updated_at', :null => false
    end

    add_index 'city_translations', ['city_id'], :name => 'index_city_translations_on_city_id'
    add_index 'city_translations', ['locale'], :name => 'index_city_translations_on_locale'
  end
end
