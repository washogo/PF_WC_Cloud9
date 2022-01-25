FactoryBot.define do
  factory :lesson do
    name { "Rubyを学ぼう！" }
    content { "Rubyの基礎から学んでいきます。" }
    sequence(:attending_style) { ["online", "offline"].sample }
    contract_period { 1 }
    price { 10000 }
    access { "大阪府泉佐野市" }
    is_in_lecture { true }
  end
end
