# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin= User.create!(email: 'admin@neevtech.com', password: '12345678', first_name: 'admin', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'admin')
puru= User.create!(email: 'puru@neevtech.com', password: '12345678', first_name: 'puru', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraisee')
naga= User.create!(email: 'naga@neevtech.com', password: '12345678', first_name: 'naga', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraisee')
rama= User.create!(email: 'rama@neevtech.com', password: '12345678', first_name: 'rama', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraisee')
ali= User.create!(email: 'ali@neevtech.com', password: '12345678', first_name: 'ali', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraisee')
kk= User.create!(email: 'kk@neevtech.com', password: '12345678', first_name: 'kk', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraisee')
sama= User.create!(email: 'sama@neevtech.com', password: '12345678', first_name: 'sama', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraisee')

atr= KraAttr.create!(name: 'a1',weightage: '30',desc: 'fdasfasdf',measures: 'fadsfasf')
atr1= KraAttr.create!(name: 'a2',weightage: '40',desc: 'fdasfasdf',measures: 'fadsfasf')
atr2= KraAttr.create!(name: 'a4',weightage: '50',desc: 'fdasfasdf',measures: 'fadsfasf')
atr2= KraAttr.create!(name: 'a5',weightage: '10',desc: 'fdasfasdf',measures: 'fadsfasf')
atr2= KraAttr.create!(name: 'a5',weightage: '20',desc: 'fdasfasdf',measures: 'fadsfasf')
atr2= KraAttr.create!(name: 'a7',weightage: '35',desc: 'fdasfasdf',measures: 'fadsfasf')
atr2= KraAttr.create!(name: 'a8',weightage: '25',desc: 'fdasfasdf',measures: 'fadsfasf')
atr2= KraAttr.create!(name: 'a9',weightage: '40',desc: 'fdasfasdf',measures: 'fadsfasf')
dept = Department.create!(name: 'BU1')
dept1 = Department.create!(name: 'BU3')
dept2 = Department.create!(name: 'BU2')
dept2 = Department.create!(name: 'BU4')
dept2 = Department.create!(name: 'BU5')
