class TranslateClusters < ActiveRecord::Migration
  def up
    Cluster.create_translation_table!  :name => :string, :description => :text,
                                                   :company => :string, :contact_person => :string,
                                                   :address  => :text, :residents => :text
  end

  def down
    Cluster.drop_translation_table!
  end
end
