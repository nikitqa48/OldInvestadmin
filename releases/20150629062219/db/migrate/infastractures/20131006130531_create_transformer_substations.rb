class CreateTransformerSubstations < ActiveRecord::Migration
  def change
    create_table :transformer_substations do |t|
      t.string   'name'
      t.text     'coords'
      t.text     'description'
      t.string   'number'
      t.text     'owner'
      t.text     'category'
      t.text     'district'
      t.text     'address'
      t.text     'operating_organization'
      t.date     'relevance'
      t.integer  'owner_id'
      
      t.timestamps
    end
    add_index(:transformer_substations, :owner_id)
  end
end
