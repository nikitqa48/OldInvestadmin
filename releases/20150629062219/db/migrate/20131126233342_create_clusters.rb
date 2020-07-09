class CreateClusters < ActiveRecord::Migration
  def change
    create_table :clusters do |t|
      t.string :name
      t.integer :municipality_id
      t.text  :coords
      t.text  :description
      t.string :company
      t.string :contact_person
      t.string :contact_phone
      t.string :contact_email
      t.text :address
      t.float :free_square
      t.text :residents
      t.boolean :demo_mode
      t.timestamps
    end
  end
end
