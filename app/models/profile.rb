class Profile < ApplicationRecord
  belongs_to :user

  validates :nickname,
    presence: true,
    length: { maximum: 50 }
end
