# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "ta130yasu@gmail.com",
  password: "EMStc02"
)

User.create!(
  name: "テスト",
  email: "test@test",
  password: "asdasd"
)


Category.create([
    { name: 'テント' },
    { name: 'シュラフ' },
    { name: 'マット'},
    { name: 'テーブル'},
    { name: 'ランタン'},
    { name: '焚き火台'},
    { name: 'バーナー'},
    { name: 'クーラーボックス'},
    { name: '調理器具'},
    { name: 'ポータブル電源'},
    { name: 'その他'}
    ])
