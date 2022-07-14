# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |n|
  User.create!(
    email: "user#{n + 1}@test.com",
    name: "User#{n + 1}",
    password: "password",
    postcode: 1000003,
    prefecture_code: 13 ,
    address_city: "千代田区一ツ橋",
    address_street: "１丁目１−１",
    address_building: "パレスサイドビル 5F"
  )
  Company.create!(
    email: "company#{n + 1}@test.com",
    name: "company#{n + 1}",
    password: "password",
    postcode: 7716403,
    prefecture_code: 36 ,
    address_city: "那賀郡那賀町",
    address_street: "木頭和無田イワツシ5-23",
    address_building: ""
)
end


products = [
    { item_name: '化粧水', price: 800 , stock_quantity: 10, company_id: 1, description: '特別な化粧水です。ニキビが一瞬で治ります。'},
    { item_name: '乳液', price: 1200 , stock_quantity: 20, company_id: 1, description: '特別な乳液です。ニキビが一瞬で治ります'},
    { item_name: 'ヘアワックス', price: 500 ,stock_quantity: 100, company_id: 1, description: '特別なヘアワックスです。すごくかっこよくなります。'},
    { item_name: 'ヘアオイル', price: 1000 , stock_quantity: 5, company_id: 1,description: '特別なヘアオイルです。天使の輪ができます。'},
    { item_name: '柔軟剤', price: 1000 , stock_quantity: 3, company_id: 1, description: '特別な柔軟剤です。さりげない香りで、好感度アップです。'},
  ]
  Product.create(products)

testers = [
    { item_name: '化粧水', price: 100 , stock_quantity: 100,  company_id: 1,description: '特別な化粧水です。ニキビが一瞬で治ります'},
    { item_name: '乳液', price: 100 , stock_quantity: 5,  company_id: 1,description: '特別な乳液です。ニキビが一瞬で治ります'},
    { item_name: 'ヘアワックス', price: 50 ,stock_quantity: 200,  company_id: 1,description: '特別なヘアワックスです。すごくかっこよくなります。'},
    { item_name: 'ヘアオイル', price: 100, stock_quantity: 500,  company_id: 1,description: '特別なヘアオイルです。天使の輪ができます。'},
    { item_name: '柔軟剤', price: 100 , stock_quantity: 5000, company_id: 1,description: '特別な柔軟剤です。さりげない香りで、好感度アップです。'},
  ]
  Tester.create(testers)
