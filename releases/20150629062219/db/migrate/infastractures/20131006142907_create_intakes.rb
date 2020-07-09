class CreateIntakes < ActiveRecord::Migration
  def change
    create_table :intakes do |t|
      t.string   'name'
      t.text     'coords'
      t.text     'intake_type'
      t.text     'address'
      t.text     'owner'
      t.text     'operating_organization'
      t.string   'year_start'
      t.float    'power'
      t.float    'water_supplied_to_net'
      t.date     'relevance'
      t.integer  'owner_id'

      t.timestamps
    end
    add_index(:intakes, :owner_id)
  end
end
