# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create do |u|
	u.email="evilzorge@gmail.com"
	u.password="12345678"
  u.role="admin"
  u.nickname = "test"
  u.name = "test"
  u.surname = "test"
end

User.create do |u|
  u.email="envoyfromgalaxy@ya.ru"
  u.password="12345678"
  u.role="user"
  u.nickname = "test"
  u.name = "test"
  u.surname = "test"
end

Type.create do |u|
  u.name = 'Sell'
end

Type.create do |u|
  u.name = 'Buy'
end

Type.create do |u|
  u.name = 'Change'
end
