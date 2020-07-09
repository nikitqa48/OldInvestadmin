class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string   'name'
      t.string   'description'
      t.string   'coords'
      t.integer  'code'
      t.datetime 'created_at',           :null => false
      t.datetime 'updated_at',           :null => false
      t.integer  'activity_sphere_code'
      t.text     'nomenclature'

      t.boolean  'demo_mode'
      t.integer  'owner_id'

      t.timestamps
    end
    add_index(:companies, :owner_id)
  end
end
