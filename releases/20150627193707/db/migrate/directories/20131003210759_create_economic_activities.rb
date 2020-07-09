class CreateEconomicActivities < ActiveRecord::Migration
  def change
    create_table :economic_activities do |t|
      t.integer :code
      t.string :name
      #
      t.timestamps
    end
    add_index(:economic_activities, :code)
  end
end
