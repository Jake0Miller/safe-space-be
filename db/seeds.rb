# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.production? || Rails.env.development?
  diapers = Item.create!(name: "Diapers")
  food = Item.create!(name: "Food")
  water = Item.create!(name: "Water")
  soap = Item.create!(name: "Soap")

  center_1 = Center.create!({ "name": "Turing Relief Center",
                   "address": "1331,17th,St,Denver,CO,80202",
                   "phone": "5555555555",
                   "website": "www.relief-center.com",
                   "email": "get-relief@this-center.com",
                   "lat": "39.7508132",
                   "lng": "-104.9967997" })

 center_2 = Center.create!({ "name": "Central Denver Disaster Relief",
                  "address": "601,W,11th,Ave,Denver,CO,80204",
                  "phone": "5555555555",
                  "website": "www.safe-space.com",
                  "email": "get-relief@that-center.com",
                  "lat": "39.7341653",
                  "lng": "-104.9974374" })

  center_3 = Center.create!({ "name": "Capitol Square Relief",
                 "address": "200,E,Colfax,Ave,Denver,CO,80203",
                 "phone": "5555555555",
                 "website": "www.denver-capitol.com",
                 "email": "get-relief@capitol-center.com",
                 "lat": "39.7341653",
                 "lng": "-104.9869956" })

  user_1 = User.create(name: 'Jake', center: center_1)
  user_2 = User.create(name: 'Jacob', center: center_1)
  user_3 = User.create(name: 'Sarah', center: center_2)
  user_4 = User.create(name: 'Ann', center: center_2)
  user_5 = User.create(name: 'Pam', center: center_2)

  CenterItem.create!(item: diapers, center: center_1, quantity: 5)
  CenterItem.create!(item: diapers, center: center_2, quantity: 4)
  CenterItem.create!(item: food, center: center_1, quantity: 4)
  CenterItem.create!(item: food, center: center_2, quantity: 5)
  CenterItem.create!(item: water, center: center_1, quantity: 10)
  CenterItem.create!(item: water, center: center_2, quantity: 12)
  CenterItem.create!(item: soap, center: center_1)
  CenterItem.create!(item: soap, center: center_3, quantity: 1)
end
