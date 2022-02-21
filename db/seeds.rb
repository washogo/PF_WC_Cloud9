# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@gmail.com',
  password: '123456'
)

Customer.create!(
 email: "aaa@amail.com",
 password: "a12345",
 last_name: "令和",
 first_name: "道子",
 last_name_kana: "れいわ",
 first_name_kana: "みちこ",
 postal_code: "1111111",
 address: "東京都渋谷区１丁目",
 phone_number: "09011111111",
 transfer_target: "ゆうちょ銀行",
 nickname: "れいこ",
 profile: "令和生まれの道子です。",
)

Customer.create!(
 email: "bbb@bmail.com",
 password: "b12345",
 last_name: "平成",
 first_name: "道夫",
 last_name_kana: "へいせい",
 first_name_kana: "みちお",
 postal_code: "2222222",
 address: "大阪府大阪市北区2丁目",
 phone_number: "09022222222",
 transfer_target: "ゆうちょ銀行",
 nickname: "みっちゃん",
 profile: "平成生まれの道夫です。",
)

Customer.create!(
 email: "ccc@cmail.com",
 password: "c12345",
 last_name: "昭和",
 first_name: "翔",
 last_name_kana: "しょうわ",
 first_name_kana: "しょう",
 postal_code: "3333333",
 address: "福岡県福岡市博多区３丁目",
 phone_number: "09033333333",
 transfer_target: "ゆうちょ銀行",
 nickname: "わしょう",
 profile: "昭和生まれの翔です。",
)

