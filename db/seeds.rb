# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ApplicationRecord.transaction do
  Order.delete_all
  PaymentMethod.delete_all
  InflowSource.delete_all
  Product.delete_all

  PaymentMethod.create(id: 1, name: 'クレジットカード')
  PaymentMethod.create(id: 2, name: '銀行振込')
  PaymentMethod.create(id: 3, name: '代引き')
  PaymentMethod.create(id: 4, name: 'コンビニ払い')
  PaymentMethod.create(id: 5, name: 'リボ払い')

  InflowSource.create(id: 1, name: '検索エンジン')
  InflowSource.create(id: 2, name: '知人の紹介')
  InflowSource.create(id: 3, name: 'Web広告')
  InflowSource.create(id: 4, name: 'YouTube')
  InflowSource.create(id: 5, name: 'その他SNS等')
  
  Product.create(id: 1, name: 'ワンピース', price: 400)
  Product.create(id: 2, name: 'ハンターハンター', price: 350)
  Product.create(id: 3, name: 'ヒカルの碁', price: 250)
  Product.create(id: 4, name: 'ゴルゴ13', price: 550)
  Product.create(id: 5, name: 'こち亀', price: 600)
  Product.create(id: 6, name: '名探偵コナン', price: 500)
end
