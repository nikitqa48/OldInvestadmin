class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer  'target_id'
      t.string   'target_type'
      t.string   'file'
      t.timestamps
    end
    add_index(:pictures, [:target_id, :target_type])
  end
end
