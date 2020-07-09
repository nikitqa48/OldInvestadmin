class CreateCompanyTranslations < ActiveRecord::Migration
  def change
    create_table :company_translations do |t|
      t.integer  'company_id'
      t.string   'locale'
      t.text     'name'
      t.text     'description'
      t.datetime 'created_at',  :null => false
      t.datetime 'updated_at',  :null => false
    end
    add_index 'company_translations', ['company_id'], :name => 'index_company_translations_on_company_id'
    add_index 'company_translations', ['locale'], :name => 'index_company_translations_on_locale'
  end
end
