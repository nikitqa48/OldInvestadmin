class CreateActivitySpheres < ActiveRecord::Migration
  def change
    create_table :activity_spheres do |t|
      t.string   'name'
      t.integer  'code'
      t.timestamps
    end
  end
end
