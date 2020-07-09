class CreateEconomicActivity < ActiveRecord::Migration
  def change
    create_table :economic_activity_translations do |t|
      t.integer  'economic_activity_id'
      t.string   'locale'
      t.text     'name'
      t.datetime 'created_at',         :null => false
      t.datetime 'updated_at',         :null => false
    end
    add_index :economic_activity_translations, ['economic_activity_id'], :name => 'index_832465fdc4cf8eeee498f48f0e2dbcd1c17ae04'
    add_index :economic_activity_translations, ['locale'], :name => 'index_economic_activity_translations_on_locale'
  end
end
