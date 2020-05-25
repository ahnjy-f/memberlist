class Replylike < ApplicationRecord
  belongs_to :member, class_name: "Member", foreign_key: "member_id", optional: true
  belongs_to :reply, class_name: "Reply", foreign_key: "reply_id", optional: true
end
