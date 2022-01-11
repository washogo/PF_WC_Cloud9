class HaveLesson < ApplicationRecord
  belongs_to :customer
  belongs_to :lesson

  enum is_in_study: { not_started: 0, in_study: 1, learned: 2 }
end
