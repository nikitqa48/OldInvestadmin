class FixPlatforms < ActiveRecord::Migration
  def change
    add_column :platforms, :permitted_uses, :text
  end
end
