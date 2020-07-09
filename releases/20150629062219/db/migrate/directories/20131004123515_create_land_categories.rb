class CreateLandCategories < ActiveRecord::Migration
  def change
    create_table :land_categories do |t|
      t.string   :name
      t.integer  :code
      t.timestamps
    end
  end
end
