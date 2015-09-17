# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

nicole = User.new({user_name: 'nicole', password: 'ivan123'})
# nicole.password=('ivan123')
nicole.save!

minh = User.new({user_name: 'minh'})
minh.password=('password')
minh.save!

cat1 = Cat.create!(name: "Purrtin", color: "orange", birth_date: 10.days.ago, sex: "F", description: "Meow", user_id: 1)

request1 = CatRentalRequest.create!(cat_id: 1, end_date: Date.today, start_date: 5.days.ago, renter_id: 2)
request1 = CatRentalRequest.create!(cat_id: 1, end_date: 6.days.ago, start_date: 7.days.ago, renter_id: 2)
request1 = CatRentalRequest.create!(cat_id: 1, end_date: 8.days.ago, start_date: 9.days.ago, renter_id: 2)
request1 = CatRentalRequest.create!(cat_id: 1, end_date: 10.days.ago, start_date: 11.days.ago, renter_id: 2)
request1 = CatRentalRequest.create!(cat_id: 1, end_date: 12.days.ago, start_date: 13.days.ago, renter_id: 2)
