class User < ApplicationRecord
  scope :user, ->  { where(name: true) }
  scope  :user, -> { name('çreated_at desc') }
  validates :confirmation, presence: true

  def self.user
    order('name_at desc').last
  end

end
