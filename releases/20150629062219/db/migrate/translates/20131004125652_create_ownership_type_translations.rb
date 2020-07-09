class CreateOwnershipTypeTranslations < ActiveRecord::Migration
  def change
    create_table 'ownership_type_translations' do |t|
      t.integer  'ownership_type_id'
      t.string   'locale'
      t.text     'name'
      t.datetime 'created_at',        :null => false
      t.datetime 'updated_at',        :null => false
    end

    add_index 'ownership_type_translations', ['locale'], :name => 'index_ownership_type_translations_on_locale'
    add_index 'ownership_type_translations', ['ownership_type_id'], :name => 'index_b6a5bfe6ee0a24540304a2cfe92b74c8d48138ef'
  end
end
