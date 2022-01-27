class ReplyRelationship < ApplicationRecord
  belongs_to :main_comment, class_name: "Comment"
  belongs_to :reply, class_name: "Comment", dependent: :destroy
  
end
