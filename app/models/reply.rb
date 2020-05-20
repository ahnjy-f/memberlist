class Reply < ApplicationRecord
  belongs_to :member, class_name: "Member", foreign_key: "member_id", optional: true
  belongs_to :post, class_name: "Post", foreign_key: "post_id", optional: true
  has_many :likes, class_name: "Like"
  accepts_nested_attributes_for :likes
end