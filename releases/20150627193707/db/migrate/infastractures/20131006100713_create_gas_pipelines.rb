class CreateGasPipelines < ActiveRecord::Migration
  def change
    create_table :gas_pipelines do |t|
      t.string   'name'
      t.text     'coords'
      t.text     'description'
      t.string   'number'
      t.float    'diameter'
      t.float    'length'
      t.text     'owner'
      t.date     'relevance'
      t.text     'operating_organization'
      t.integer  'owner_id'
      #
      t.timestamps
    end
    add_index(:gas_pipelines, :owner_id)
  end
end
