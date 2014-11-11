# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Rich Seviora', email:'rich@seviora.com',date_of_birth: Date.new(1982,5,4), password: 'rich')
User.find(1).prescriptions.create(name: 'Vyvanse', date_issued: Date.new(2014,5,28))