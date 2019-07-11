class User < ApplicationRecord


    validates :name, presence: true, length: {maximum: 150 }

    validates :password, presence: true,length: {maximum: 50}

end
