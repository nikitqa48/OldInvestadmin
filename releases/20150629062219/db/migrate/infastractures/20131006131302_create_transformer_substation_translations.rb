class CreateTransformerSubstationTranslations < ActiveRecord::Migration
  def change
    create_table :transformer_substation_translations do |t|
      t.integer  'transformer_substation_id'
      t.string   'locale'
      t.string   'name'
      t.text     'description'
      t.text     'owner'
      t.text     'category'
      t.text     'district'
      t.text     'address'
      t.text     'operating_organization'
      t.datetime 'created_at',                :null => false
      t.datetime 'updated_at',                :null => false
    end

    add_index 'transformer_substation_translations', ['locale'], :name => 'index_transformer_substation_translations_on_locale'
    add_index 'transformer_substation_translations', ['transformer_substation_id'], :name => 'index_d919d8f9360560fc7c69098f3147e805f03f4476'
  end
end