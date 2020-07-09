class CreateHeatingMains < ActiveRecord::Migration
  def change
    create_table :heating_mains do |t|
      t.string   'name'
      t.text     'coords'
      t.text     'description'
      t.float    'diameter'
      t.float    'length'
      t.text     'owner'
      t.text     'operating_organization'
      t.date     'relevance'
      t.integer  'owner_id'
      t.timestamps
    end
    add_index(:heating_mains, :owner_id)
  end
end
