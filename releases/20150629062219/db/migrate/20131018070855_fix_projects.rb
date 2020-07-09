class FixProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :business_project
  end
end
