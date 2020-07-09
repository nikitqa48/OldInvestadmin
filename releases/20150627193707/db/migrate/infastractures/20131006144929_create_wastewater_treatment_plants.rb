class CreateWastewaterTreatmentPlants < ActiveRecord::Migration
  def change
    create_table :wastewater_treatment_plants do |t|
      t.string   'name'
      t.text     'coords'
      t.text     'build_type'
      t.text     'address'
      t.text     'owner'
      t.text     'operating_organization'
      t.string   'year_start'
      t.float    'power'
      t.float    'conceded_wastewater'
      t.date     'relevance'
      t.integer  'owner_id'
      t.timestamps
    end
    add_index(:wastewater_treatment_plants, :owner_id)
  end
end
