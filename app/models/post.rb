class Post < ApplicationRecord
  belongs_to :member, class_name: "Member", foreign_key: "member_id", optional: true
  has_many :replies,-> { order 'created_at asc' }, class_name: "Reply",dependent: :destroy
  accepts_nested_attributes_for :replies

end
