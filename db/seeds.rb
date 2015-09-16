# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

nicole = User.new({user_name: 'nicole'})
nicole.password=('ivan123')
nicole.ensure_session_token
nicole.save!

minh = User.new({user_name: 'minh'})
minh.password=('password')
minh.ensure_session_token
minh.save!
