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
 nickname: "れいこ",
 profile: "令和生まれの道子です。",
)

Customer.create!(
 email: "bbb@bmail.com",
 password: "b12345",
 nickname: "みっちゃん",
 profile: "平成生まれの道夫です。",
)

Customer.create!(
 email: "ccc@cmail.com",
 password: "c12345",
 nickname: "わしょう",
 profile: "昭和生まれの翔です。",
)

Address.create!(
 customer_id: 1,
 name: "令和道子",
 postal_code: "1111111",
 address: "東京都渋谷区１丁目",
 shipping_fee: 500,
)

Address.create!(
 customer_id: 2,
 name: "平成道夫",
 postal_code: "2222222",
 address: "大阪府大阪市北区2丁目",
 shipping_fee: 500,
)

Address.create!(
 customer_id: 3,
 name: "昭和翔",
 postal_code: "3333333",
 address: "福岡県福岡市博多区３丁目",
 shipping_fee: 500,
)

PaymentMethod.create!(
 customer_id: 1,
 method: 1,
)

PaymentMethod.create!(
 customer_id: 2,
 method: 1,
)

PaymentMethod.create!(
 customer_id: 3,
 method: 0,
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

Lesson.create!(
 customer_id: 3,
 category_id: 2,
 name: "プログラミングを知ろう！",
 content: "プログラミングの基礎を楽しく学ぶことができます！",
 attending_style: 0,
 access: "https://www.google.com",
 contract_period: 0,
 price: 10000,
 is_in_lecture: true,
)

Lesson.create!(
 customer_id: 3,
 category_id: 5,
 name: "Ruby on Railsを学ぼう！",
 content: "Ruby on Railsのチュートリアルを一緒にやってみましょう！",
 attending_style: 0,
 access: "https://www.google.com",
 contract_period: 6,
 price: 60000,
 is_in_lecture: true,
)

Lesson.create!(
 customer_id: 2,
 category_id: 3,
 name: "JavaScriptを楽しめ！",
 content: "JavaScriptの基礎を学ぶための学習ロードマップを提供しています！",
 attending_style: 0,
 access: "https://www.google.com",
 contract_period: 1,
 price: 10000,
 is_in_lecture: true,
)

Lesson.create!(
 customer_id: 2,
 category_id: 4,
 name: "Reactを最速で学ぶ！",
 content: "React.jsの使い方を学び、簡単なtodoアプリを作成しよう！",
 attending_style: 0,
 access: "https://www.google.com",
 contract_period: 1,
 price: 20000,
 is_in_lecture: true,
)

Lesson.create!(
 customer_id: 1,
 category_id: 6,
 name: "Let's enjoy English！",
 content: "簡単な英語で自己紹介できるようになります！",
 attending_style: 0,
 access: "https://www.google.com",
 contract_period: 0,
 price: 10000,
 is_in_lecture: true,
)

Lesson.create!(
 customer_id: 1,
 category_id: 7,
 name: "Let's enjoy English！2",
 content: "日常会話ができるようになります！",
 attending_style: 0,
 access: "https://www.google.com",
 contract_period: 6,
 price: 30000,
 is_in_lecture: true,
)

Lesson.create!(
 customer_id: 1,
 category_id: 8,
 name: "TOEIC７００点の壁をぶっ壊す！",
 content: "TOEICで７００点取得を目指している方を対象とした講座です。",
 attending_style: 0,
 access: "https://www.google.com",
 contract_period: 6,
 price: 60000,
 is_in_lecture: false,
)

Lesson.create!(
 customer_id: 1,
 category_id: 7,
 name: "Let's enjoy English！3",
 content: "ビジネス英語ができるようになります！",
 attending_style: 0,
 access: "https://www.google.com",
 contract_period: 6,
 price: 30000,
 is_in_lecture: true,
)

Tag.create!(
 name: "Ruby"
)

Tag.create!(
 name: "Ruby on Rails"
)

Tag.create!(
 name: "プログラミング初心者"
)

Tag.create!(
 name: "プログラミング教育"
)

Tag.create!(
 name: "HTML"
)

Tag.create!(
 name: "CSS"
)

Tag.create!(
 name: "VScode"
)

Tag.create!(
 name: "JavaScript"
)

Tag.create!(
 name: "React.js"
)

Tag.create!(
 name: "Next.js"
)

Tag.create!(
 name: "jQuery"
)

Tag.create!(
 name: "英語学習"
)

Tag.create!(
 name: "海外留学"
)

Tag.create!(
 name: "English"
)

Tag.create!(
 name: "ビジネス英語"
)

Tag.create!(
 name: "英語教育"
)

Tag.create!(
 name: "オールイングリッシュ"
)

Tag.create!(
 name: "TOEIC"
)

TagList.create!(
 lesson_id: 1,
 tag_id: 1,
)

TagList.create!(
 lesson_id: 1,
 tag_id: 3,
)

TagList.create!(
 lesson_id: 1,
 tag_id: 7,
)

TagList.create!(
 lesson_id: 2,
 tag_id: 3,
)

TagList.create!(
 lesson_id: 2,
 tag_id: 4,
)

TagList.create!(
 lesson_id: 2,
 tag_id: 5,
)

TagList.create!(
 lesson_id: 2,
 tag_id: 6,
)

TagList.create!(
 lesson_id: 3,
 tag_id: 1,
)

TagList.create!(
 lesson_id: 3,
 tag_id: 2,
)

TagList.create!(
 lesson_id: 4,
 tag_id: 8,
)

TagList.create!(
 lesson_id: 4,
 tag_id: 11,
)

TagList.create!(
 lesson_id: 4,
 tag_id: 7,
)

TagList.create!(
 lesson_id: 5,
 tag_id: 8,
)

TagList.create!(
 lesson_id: 5,
 tag_id: 9,
)

TagList.create!(
 lesson_id: 5,
 tag_id: 10,
)

TagList.create!(
 lesson_id: 5,
 tag_id: 7,
)

TagList.create!(
 lesson_id: 6,
 tag_id: 12,
)

TagList.create!(
 lesson_id: 6,
 tag_id: 14,
)

TagList.create!(
 lesson_id: 6,
 tag_id: 16,
)

TagList.create!(
 lesson_id: 6,
 tag_id: 17,
)

TagList.create!(
 lesson_id: 7,
 tag_id: 12,
)

TagList.create!(
 lesson_id: 7,
 tag_id: 13,
)

TagList.create!(
 lesson_id: 7,
 tag_id: 17,
)

TagList.create!(
 lesson_id: 7,
 tag_id: 18,
)

TagList.create!(
 lesson_id: 8,
 tag_id: 18,
)

TagList.create!(
 lesson_id: 8,
 tag_id: 13,
)

TagList.create!(
 lesson_id: 9,
 tag_id: 12,
)

TagList.create!(
 lesson_id: 9,
 tag_id: 15,
)

TagList.create!(
 lesson_id: 9,
 tag_id: 17,
)

HaveLesson.create!(
 customer_id: 1,
 lesson_id: 1,
 is_in_study: 2,
 progress: 100,
)

HaveLesson.create!(
 customer_id: 1,
 lesson_id: 2,
 is_in_study: 2,
 progress: 100,
)

HaveLesson.create!(
 customer_id: 1,
 lesson_id: 3,
 is_in_study: 1,
 progress: 30,
)

HaveLesson.create!(
 customer_id: 2,
 lesson_id: 6,
 is_in_study: 2,
 progress: 100,
)

HaveLesson.create!(
 customer_id: 2,
 lesson_id: 7,
 is_in_study: 2,
 progress: 100,
)

HaveLesson.create!(
 customer_id: 2,
 lesson_id: 8,
 is_in_study: 1,
 progress: 50,
)

HaveLesson.create!(
 customer_id: 3,
 lesson_id: 4,
 is_in_study: 0,
 progress: 0,
)

HaveLesson.create!(
 customer_id: 3,
 lesson_id: 5,
 is_in_study: 0,
 progress: 0,
)

Evaluation.create!(
 customer_id: 1,
 lesson_id: 1,
 evaluation: 3,
 review: "とても良かったです！",
)

Evaluation.create!(
 customer_id: 1,
 lesson_id: 2,
 evaluation: 4,
 review: "最高に良かったです！",
)

Evaluation.create!(
 customer_id: 2,
 lesson_id: 6,
 evaluation: 3,
 review: "とても楽しく学べました！",
)

Evaluation.create!(
 customer_id: 2,
 lesson_id: 7,
 evaluation: 4,
 review: "英語に自信が持てるようになりました！",
)

