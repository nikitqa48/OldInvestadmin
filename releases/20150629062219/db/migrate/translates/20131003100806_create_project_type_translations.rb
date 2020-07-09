class CreateProjectTypeTranslations < ActiveRecord::Migration
  def change
    create_table 'project_type_translations' do |t|
      t.integer  'project_type_id'
      t.string   'locale'
      t.text     'name'
      t.datetime 'created_at',      :null => false
      t.datetime 'updated_at',      :null => false
    end

    add_index 'project_type_translations', ['locale'], :name => 'index_project_type_translations_on_locale'
    add_index 'project_type_translations', ['project_type_id'], :name => 'index_b6fbec0b0b93e684e7e73179c6d760a5fcec77c4'
  end
end
