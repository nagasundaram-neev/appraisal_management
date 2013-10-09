# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user= User.create!(email: 'admin@neevtech.com', password: '12345678', first_name: 'admin', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'admin')
role = Role.create!(name: 'dev')
role1 = Role.create!(name: 'senior dev')
atr= KraAttr.create!(name: 'a1',weightage: '30',desc: 'fdasfasdf',measures: 'fadsfasf')
atr1= KraAttr.create!(name: 'a2',weightage: '30',desc: 'fdasfasdf',measures: 'fadsfasf')
atr2= KraAttr.create!(name: 'a3',weightage: '30',desc: 'fdasfasdf',measures: 'fadsfasf')
dept = Department.create!(name: 'BU1')
dept2 = Department.create!(name: 'BU2')
