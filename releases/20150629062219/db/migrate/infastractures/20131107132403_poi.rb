class Poi < ActiveRecord::Migration
  def change
    create_table :point_of_interests do |t|
      t.string   'name'
      t.text     'coords'
      t.text     'description'
      t.text     'owner'
      t.integer  'owner_id'
      t.integer  'point_of_interest_type_code'
      t.timestamps
    end
    add_index(:point_of_interests, :owner_id)
  end
end
