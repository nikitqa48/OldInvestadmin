class CreateSewers < ActiveRecord::Migration
  def change
    create_table :sewers do |t|
      t.string   'name'
      t.text     'coords'
      t.text     'description'
      t.text     'owner'
      t.text     'operating_organization'
      t.string   'year_start'
      t.float    'power'
      t.date     'relevance'
      t.integer  'owner_id'
      t.timestamps
    end
    add_index(:sewers, :owner_id)
  end
end
