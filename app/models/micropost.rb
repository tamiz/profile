class Micropost < ApplicationRecord
  belongs_to :user, dependent: :destroy

  default_scope ->  { order(created_at: :desc ) }
  validates :user_id
  validates :content, presence: true, length: { maximum: 150}
end

