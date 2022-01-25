FactoryBot.define do
  factory :tag do
    name { |n| "プログラミング#{n}" }
  end
end
