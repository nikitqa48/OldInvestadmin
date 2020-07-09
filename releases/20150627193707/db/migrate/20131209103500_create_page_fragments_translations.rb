class CreatePageFragmentsTranslations < ActiveRecord::Migration
  def change
    create_table :page_fragment_translations do |t|
    	t.integer  "page_fragment_id", null: false
	    t.string   "locale",           null: false
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.text     "content"
    end
  end
end
