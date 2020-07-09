class CreateMunicipalities < ActiveRecord::Migration
  def change
    create_table :municipalities do |t|
      t.string 'name'
      t.text 'description'
      t.text 'coords'
      t.integer 'code'
      t.datetime 'created_at', :null => false
      t.datetime 'updated_at', :null => false
      t.integer 'owner_id'
      t.string 'area'
      t.string 'density'
      t.string 'population'
      t.string 'chief'
      t.string 'status'
      t.string 'based'
      t.string 'distance_to_petropavlovsk_kamchatsky'
      t.string 'contacts'
      t.string 'average_wage'
      t.integer 'number_of_unemployed'
      t.string 'registered_unemployment'
      t.boolean :demo_mode
      #
      t.timestamps
    end
    add_index(:municipalities, :owner_id)
  end
end
