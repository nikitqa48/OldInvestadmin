class CreateMunicipalityTranslations < ActiveRecord::Migration
  def change
    create_table 'municipality_translations' do |t|
      t.integer  'municipality_id'
      t.string   'locale'
      t.text     'name'
      t.text     'description'
      t.datetime 'created_at',           :null => false
      t.datetime 'updated_at',           :null => false
      t.string   'area'
      t.string   'density'
      t.string   'population'
      t.string   'chief'
      t.string   'status'
      t.string   'based'
      t.string   'distance_to_petropavlovsk_kamchatsky'
      t.string   'contacts'
    end

    add_index 'municipality_translations', ['locale'], :name => 'index_municipality_translations_on_locale'
    add_index 'municipality_translations', ['municipality_id'], :name => 'index_5e3a25223de7bbd82d27edc481fa389849010cae'
  end
end