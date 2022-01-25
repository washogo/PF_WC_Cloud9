FactoryBot.define do
  factory :evaluation do
    sequence(:evaluation) { ["1", "2", "3", "4", "5"].sample }
    review { "最高です。" }
  end
end
