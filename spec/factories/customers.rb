FactoryBot.define do
  factory :customer do
    sequence(:email) { |n| "shogo#{n}@example.com"}
    sequence(:password) { |n| "washogo#{n}" }
    last_name { "wada" }
    first_name { "shogo" }
    last_name_kana { "ワダ" }
    first_name_kana { "ショウゴ" }
    postal_code { "2345678" }
    address { "大阪府大阪市北区１丁目" }
    sequence(:phone_number) { |n| "090#{n}9999999" }
    sequence(:transfer_target) { |n| "ゆうちょ銀行#{n}支店" }
    nickname { |n |"washogo#{n}" }
    sequence(:is_deleted){ [true, false].sample }
  end
end
