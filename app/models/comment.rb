class Comment < ApplicationRecord
  belongs_to :customer

  has_one :replying_relationships, class_name: "ReplyRelationship", foreign_key: "reply_id", dependent: :destroy
  has_one :replying, through: :reply_relationships, source: :main_comment

  has_many :replied_relationships, class_name: "ReplyRelationship", foreign_key: "main_comment_id", dependent: :destroy
  has_many :replied, through: :replied_relationships, source: :reply
  
end
