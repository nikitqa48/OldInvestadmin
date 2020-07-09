namespace :assets do

  def non_digested path
    assets = Dir.glob(File.join(Rails.root, path))
    regex = /(-{1}[a-z0-9]{32}*\.{1}){1}/
    assets.each do |file|
      next if File.directory?(file) || file !~ regex

      source = file.split('/')
      source.push(source.pop.gsub(regex, '.'))

      non_digested = File.join(source)
      FileUtils.mv(file, non_digested)
    end
  end

  task :fix_ckeditor, :environment do
    #last_modified_css = Dir[File.join(Rails.root, 'public/assets', 'ckeditor-*.css')].sort_by{ |f| File.mtime(f) }.last
    #FileUtils.cp(last_modified_css, File.join(Rails.root, 'public/assets', 'ckeditor.css'))
    non_digested 'public/assets/ckeditor/**/*'
  end

end