class HaveLesson < ApplicationRecord
  belongs_to :customer
  belongs_to :lesson

  enum is_in_study: { not_started: 0, in_study: 1, learned: 2 }

  with_options presence: true do
    validates :is_in_study
    validates :progress
  end

  validates :is_in_study, inclusion: {in: ["not_started", "in_study", "learned"]}

end
