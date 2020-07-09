class UpdateProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :territory_code
    add_column    :projects, :territory, :string
  end
end
