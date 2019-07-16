class User < ApplicationRecord
    has_many :microposts
    attr_accessor :remember_token
    before_save { self.email = email.downcase }

    has_secure_password
    mount_uploader :picture, PictureUploader

    validates :name, presence: true, length: {maximum: 150 }
    validates :password, presence: true,length: {maximum: 50}

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                   BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = User.new_token
        update_attribute(:rember_digest, User.digest(remember_token))
    end

end


