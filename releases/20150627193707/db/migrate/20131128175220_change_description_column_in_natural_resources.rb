class ChangeDescriptionColumnInNaturalResources < ActiveRecord::Migration
  def up
    change_table "natural_resources" do |t|
      t.change   "description", :text
    end
  end
  
  def down
    change_table "natural_resources" do |t|
      t.change   "description", :string
    end
  end
end
