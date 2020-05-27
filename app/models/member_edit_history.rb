class MemberEditHistory < ApplicationRecord
    self.inheritance_column = nil

    belongs_to :member, class_name: "Member", foreign_key: "member_id", optional: true
    alias_attribute :occurred_at, :updated_at
end
