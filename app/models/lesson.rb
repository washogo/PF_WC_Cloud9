class Lesson < ApplicationRecord
  enum attending_style: [ :online, :offline ]
end
