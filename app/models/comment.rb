class Comment < ApplicationRecord
  belongs_to :customer
  has_many :reply_comments
end
