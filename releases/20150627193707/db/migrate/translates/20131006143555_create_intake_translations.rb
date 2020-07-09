class CreateIntakeTranslations < ActiveRecord::Migration
  def change
    create_table :intake_translations do |t|
      t.integer  'intake_id'
      t.string   'locale'
      t.string   'name'
      t.text     'intake_type'
      t.text     'address'
      t.text     'owner'
      t.text     'operating_organization'
      t.datetime 'created_at',             :null => false
      t.datetime 'updated_at',             :null => false
    end

    add_index 'intake_translations', ['intake_id'], :name => 'index_intake_translations_on_intake_id'
    add_index 'intake_translations', ['locale'], :name => 'index_intake_translations_on_locale'
  end
end
