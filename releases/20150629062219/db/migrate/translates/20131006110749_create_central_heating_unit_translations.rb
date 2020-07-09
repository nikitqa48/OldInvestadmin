class CreateCentralHeatingUnitTranslations < ActiveRecord::Migration
  def change
    create_table :central_heating_unit_translations do |t|
      t.integer  'central_heating_unit_id'
      t.string   'locale'
      t.string   'name'
      t.text     'fuel_type'
      t.text     'equipment_type'
      t.datetime 'created_at',              :null => false
      t.datetime 'updated_at',              :null => false
    end
    add_index 'central_heating_unit_translations', ['central_heating_unit_id'], :name => 'index_53f8b2a053f0e6325af9edfc5e5ba1a0db9cf3f5'
    add_index 'central_heating_unit_translations', ['locale'], :name => 'index_central_heating_unit_translations_on_locale'
  end
end
