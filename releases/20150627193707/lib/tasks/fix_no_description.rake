# encoding: utf-8

namespace :fix do
  task :no_description => [:environment] do
    Project.all.each do |p|
      if p.territory_description == "1" || p.description == "1"
        p.territory_description = 'Не указано' if p.territory_description == '1'
        p.description = 'Не указано' if p.description == '1'
        p.save :validate => false
        puts p.id
      end
    end
  end
end