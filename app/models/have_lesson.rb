class HaveLesson < ApplicationRecord
  belongs_to :customer
  belongs_to :lesson
end
