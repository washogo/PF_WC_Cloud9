FactoryBot.define do
  factory :have_lesson do
    sequence(:is_in_study) { ["not_started", "in_study", "learned"].sample }
    sequence(:progress) { [*0..100].sample }
  end
end
