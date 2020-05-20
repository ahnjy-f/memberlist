class Post < ApplicationRecord
  belongs_to :member, class_name: "Member", foreign_key: "member_id", optional: true
  has_many :replies, class_name: "Reply"
  has_many :likes, class_name: "Like"
  
  accepts_nested_attributes_for :replies
  accepts_nested_attributes_for :likes
end
