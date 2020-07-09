class CreateGasPipelineTranslations < ActiveRecord::Migration
  def change
    create_table :gas_pipeline_translations do |t|
      t.integer  'gas_pipeline_id'
      t.string   'locale'
      t.string   'name'
      t.text     'description'
      t.text     'owner'
      t.text     'operating_organization'
      t.datetime 'created_at',             :null => false
      t.datetime 'updated_at',             :null => false
    end
    add_index 'gas_pipeline_translations', ['gas_pipeline_id'], :name => 'index_gas_pipeline_translations_on_gas_pipeline_id'
    add_index 'gas_pipeline_translations', ['locale'], :name => 'index_gas_pipeline_translations_on_locale'
  end
end
