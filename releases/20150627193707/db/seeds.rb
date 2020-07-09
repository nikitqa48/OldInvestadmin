# encoding: utf-8

if User.count.zero?
  User.create!(email: 'admin@mystand.ru', password: '123qwe', role: 'admin')
  puts 'User admin@mystand.ru created'.green
end

Dir[Rails.root + 'db/seeds/directories/*.rb'].each { |file| require file }