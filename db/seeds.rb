# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Provider.where(name: 'Power R Us', address: '1234 Power Drive', phone: '555-555-5555', email: 'outage@power.us').first_or_create
Provider.where(name: 'WaterHandlers Inc.', address: '1234 Water Drive', phone: '222-555-5555', email: 'outage@water.us').first_or_create

Service.where(name: 'Power', color: '#ef3122').first_or_create
Service.where(name: 'Gas', color: '#fff101').first_or_create
Service.where(name: 'Water', color: '#006eb6').first_or_create
Service.where(name: 'Sewer', color: '#009365').first_or_create

Service.where(name: 'Phone', color: '#f7981d').first_or_create
Service.where(name: 'Internet', color: '#f7981d').first_or_create
Service.where(name: 'Cable', color: '#f7981d').first_or_create

Service.where(name: 'Celluar', color: '#f7981d').first_or_create

