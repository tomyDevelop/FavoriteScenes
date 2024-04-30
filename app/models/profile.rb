class Profile < ApplicationRecord
  belongs_to :user

  validates :nickname,
    presence: true,
    length: { maximum: 50 }

  def self.ransackable_attributes(auth_object = nil)
    ["nickname"]
  end
end
