# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
products = [
    { item_name: '鉛筆', price: 100 ,size: 100, stock_quantity: 100},
    { item_name: 'ボールペン', price: 200 ,size: 100, stock_quantity: 100},
    { item_name: '消しゴム', price: 50 ,size: 100,stock_quantity: 100},
    { item_name: 'ノート', price: 100 ,size: 100, stock_quantity: 100}
  ]
  Product.create(products)
