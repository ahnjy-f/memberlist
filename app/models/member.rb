class Member < ApplicationRecord
    
    has_one :account, class_name: "Account",dependent: :destroy
    has_many :history, class_name: "MemberEditHistory",dependent: :destroy
    has_many :posts ,-> { order 'created_at desc' },dependent: :destroy,class_name: "Post"
    has_many :replies,class_name: "Reply",dependent: :destroy
    has_many :likes, class_name: "Like",dependent: :destroy
    has_many :replylikes,class_name: "Replylike",dependent: :destroy
    has_many :like, class_name: "Like",dependent: :destroy
    attr_accessor :face_photo_path
    mount_uploader :face_photo_path , ImageUploader

    accepts_nested_attributes_for :account
    accepts_nested_attributes_for :posts
    accepts_nested_attributes_for :replies
    accepts_nested_attributes_for :likes
    accepts_nested_attributes_for :replylikes
    accepts_nested_attributes_for :like
    def active?
        deleted_at.nil? || deleted_at > Date.today
    end

end
