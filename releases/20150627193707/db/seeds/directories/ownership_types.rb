# encoding: utf-8
# Типы собственности

ownership_types = []
ownership_types.push({:code => 0, :value => {:ru => 'Индивидуальная собственность', :en => 'Individual ownership'}})
ownership_types.push({:code => 1, :value => {:ru => 'Коллективная собственность', :en => 'Collective property'}})
ownership_types.push({:code => 2, :value => {:ru => 'Государственная собственность ', :en => 'State ownership'}})

ownership_types.each do |hash|
  code = hash[:code]
  unless OwnershipType.find_by_code(code)
    value = hash[:value][:ru]
    record = OwnershipType.create(:code => code, :name => value)
    I18n.locale = :en
    record.name = hash[:value][:en]
    record.save
    puts "  created: #{record.name}".green
    I18n.locale = :ru
  end
end