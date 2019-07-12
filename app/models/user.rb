class User < ApplicationRecord

    has_many :microposts
    mount_uploader :picture, PictureUploader
    validates :user_id, presence: true
    validates :content, presence: true, length: {maximum: 150 }
    validates :name, presence: true, length: {maximum: 150 }
    validates :password, presence: true,length: {maximum: 50}

    def logged_in
        !current_user.nil?
    end
end


