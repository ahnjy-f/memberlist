class Member < ApplicationRecord

    has_one :account, class_name: "Account"
    has_many :history, class_name: "MemberEditHistory"
    has_many :posts, class_name: "Post"
    has_many :replies, class_name: "Reply"
    has_many :likes, class_name: "Like" 

    accepts_nested_attributes_for :account
    accepts_nested_attributes_for :posts
    accepts_nested_attributes_for :replies
    accepts_nested_attributes_for :likes

end
