# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.production? || Rails.env.development?
  food = Item.create!(name: "Food", consumable: true)
  water = Item.create!(name: "Water", consumable: true)
  soap = Item.create!(name: "Soap", consumable: true)
  bed = Item.create!(name: "Bed, Blanket, & Pillow", consumable: false)
  tbrush = Item.create!(name: "Toothbrush", consumable: false)
  tpaste = Item.create!(name: "Toothpaste", consumable: true)
  tpaper = Item.create!(name: "Toilet paper", consumable: true)
  clothes = Item.create!(name: "Clothes", consumable: false)
  medical = Item.create!(name: "Medical supplies", consumable: true)

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

  Center.all.each do |center|
    Item.all.each do |item|
      CenterItem.create!(item: item, center: center)
    end
  end
end
