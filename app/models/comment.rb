class Comment < ApplicationRecord
  belongs_to :customer

  has_one :replying_relationship, class_name: "ReplyRelationship", foreign_key: "reply_id", dependent: :destroy
  has_one :replying, through: :replying_relationship, source: :main_comment

  has_many :replied_relationships, class_name: "ReplyRelationship", foreign_key: "main_comment_id", dependent: :destroy
  has_many :replied, through: :replied_relationships, source: :reply

  validates :comment, presence: true


end
