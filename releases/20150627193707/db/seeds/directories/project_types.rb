# encoding: utf-8

# Типы проектов
project_types = []
project_types.push({code: 0, value: {ru: 'Планируемый', en: 'Planned'}})
project_types.push({code: 1, value: {ru: 'Реализованный', en: 'Implemented'}})
project_types.push({code: 2, value: {ru: 'Реализуемый', en: 'Ongoing'}})


project_types.each do |hash|
  code = hash[:code]
  unless ProjectType.find_by_code(code)
    value = hash[:value][:ru]
    record = ProjectType.create(code: code, name: value)
    I18n.locale = :en
    record.name = hash[:value][:en]
    record.save
    puts "Project Type `#{record.name}` created".green
    I18n.locale = :ru
  end
end