class Member < ApplicationRecord

    has_one :account, class_name: "Account"
    has_many :histories, class_name: "MemberEditHistory"

    accepts_nested_attributes_for :account
end
