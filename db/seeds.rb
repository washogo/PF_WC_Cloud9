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

Address.create!(
 customer_id: 1,
 name: "令和道子",
 postal_code: "1111111",
 address: "東京都渋谷区１丁目",
)

Address.create!(
 customer_id: 2,
 name: "平成道夫",
 postal_code: "2222222",
 address: "大阪府大阪市北区2丁目",
)

Address.create!(
 customer_id: 3,
 name: "昭和翔",
 postal_code: "3333333",
 address: "福岡県福岡市博多区３丁目",
)

Category.create!(
 name: "Ruby" 
)

Category.create!(
 name: "プログラミング" 
)

Category.create!(
 name: "JavaScript" 
)

Category.create!(
 name: "React.js" 
)

Category.create!(
 name: "Ruby on Rails" 
)

Category.create!(
 name: "英語" 
)

Category.create!(
 name: "英会話" 
)

Category.create!(
 name: "TOEIC" 
)

Comment.create!(
 customer_id: 1,
 comment: "プログラミングは難しいですか？",
)

Comment.create!(
 customer_id: 2,
 comment: "プログラミングは楽しいよ！",
)

Comment.create!(
 customer_id: 3,
 comment: "好きになれたら強いねー",
)

Comment.create!(
 customer_id: 2,
 comment: "英語楽しい！！",
)

Comment.create!(
 customer_id: 3,
 comment: "英語は何を勉強しているんですか？",
)

Comment.create!(
 customer_id: 2,
 comment: "TOEICだよー",
)

Comment.create!(
 customer_id: 1,
 comment: "やっぱり楽しいと学びが加速しますよね！",
)

Comment.create!(
 customer_id: 3,
 comment: "好きなプログラミング言語は何ですか？",
)

Comment.create!(
 customer_id: 1,
 comment: "Rubyが好きです！",
)

Comment.create!(
 customer_id: 2,
 comment: "バックエンドならPHP,フロントエンドならJavaScriptだねー",
)

ReplyRelationship.create!(
 main_comment_id: 1,
 reply_id: 2,
)

ReplyRelationship.create!(
 main_comment_id: 1,
 reply_id: 3,
)

ReplyRelationship.create!(
 main_comment_id: 4,
 reply_id: 5,
)

ReplyRelationship.create!(
 main_comment_id: 5,
 reply_id: 6,
)

ReplyRelationship.create!(
 main_comment_id: 4,
 reply_id: 7,
)

ReplyRelationship.create!(
 main_comment_id: 8,
 reply_id: 9,
)

ReplyRelationship.create!(
 main_comment_id: 8,
 reply_id: 10,
)

Lesson.create!(
 customer_id: 3,
 category_id: 1,
 name: "Rubyの基礎を学ぼう！",
 content: "Rubyの基礎を楽しく学ぶことができます！",
 attending_style: 1,
 access: "福岡県福岡市",
 contract_period: 1,
 price: 10000,
 is_in_lecture: true,
)