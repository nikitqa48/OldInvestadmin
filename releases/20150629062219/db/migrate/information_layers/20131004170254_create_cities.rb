class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string 'name'
      t.string 'coords'
      t.integer 'code'
      t.text 'description'
      t.text 'area'
      t.string 'population'
      t.string 'based'
      t.string 'chief'
      t.string 'site'
      t.string 'density'
      t.string 'subdivisions'
      t.string 'economically_active_population'
      t.boolean :demo_mode
      #
      t.timestamps
    end
  end
end
