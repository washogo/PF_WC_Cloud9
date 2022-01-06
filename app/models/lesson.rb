class Lesson < ApplicationRecord
  belongs_to :category
  enum attending_style: [ :online, :offline ]
end
