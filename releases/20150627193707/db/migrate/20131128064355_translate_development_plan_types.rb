class TranslateDevelopmentPlanTypes < ActiveRecord::Migration
  def up
    DevelopmentPlanType.create_translation_table! :name => :string
  end

  def down
    DevelopmentPlanType.drop_translation_table!
  end
end
