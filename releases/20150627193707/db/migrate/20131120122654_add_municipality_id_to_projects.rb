class AddMunicipalityIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :municipality_id, :integer
  end
end
