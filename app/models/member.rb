class Member < ApplicationRecord
    
    has_one :account, class_name: "Account"
    has_many :history, class_name: "MemberEditHistory"
    has_many :posts, class_name: "Post"
    has_many :replies, class_name: "Reply"
    has_many :likes, class_name: "Like" 

    attr_accessor :face_photo_path
    mount_uploader :face_photo_path , ImageUploader

    accepts_nested_attributes_for :account
    accepts_nested_attributes_for :posts
    accepts_nested_attributes_for :replies
    accepts_nested_attributes_for :likes

    def active?
        deleted_at.nil? || deleted_at > Date.today
    end

end
