class ReplyComment < ApplicationRecord
  belongs_to :customer
  belongs_to :comment
end
