class CreateActivitySphereTranslations < ActiveRecord::Migration
  def change
    create_table 'activity_sphere_translations' do |t|
      t.integer 'activity_sphere_id'
      t.string 'locale'
      t.text 'name'
      t.datetime 'created_at', :null => false
      t.datetime 'updated_at', :null => false
    end

    add_index 'activity_sphere_translations', ['activity_sphere_id'], :name => 'index_832465fdc4cf8b919e498f48f0e2dbcd1c17ae04'
    add_index 'activity_sphere_translations', ['locale'], :name => 'index_activity_sphere_translations_on_locale'
  end
end