class AddRemoteCode < ActiveRecord::Migration
  def change
  	add_column :projects, 				:remote_code, :string
  	add_column :platforms, 				:remote_code, :string
  	add_column :special_economic_zones, :remote_code, :string
  end
end